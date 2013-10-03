{
 * roots sokoban
 * Copyright (c) 2005 by Salvatore Previti.
 * All Rights Reserved.
 *
 * NeoGeek - roots - NeoGMatrix@tin.it
 *
 * This is open software; you can redistribute it and/or modify it under
 * the terms of the version 2.1 of the GNU Lesser General Public License
 * as published by the Free Software Foundation.
 *
 * This software is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
 * or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General
 * Public License for more details.
 *
 * The file COPYING contains important info about Licenses and Copyrights.
 * Please read the COPYING file for details about this open software.
 *
 * A copy of version 2.1 of the GNU Lesser General Public License is
 * distributed with this software under the filename COPYING-LGPL. 
 * You should have received a copy with this software;
 * if not, write to Free Software Foundation, Inc.
 * 59 Temple Place, Suite 330, Boston, MA  02111-1307, USA.
 *
 *
 * Share and enjoy! :-)
}

unit frmGame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, GameGrid, Grids, xmldom, XMLIntf, msxmldom,
  XMLDoc, GameEngine, GameBoardStyle, GameBoard, GClasses, Buttons, GameLevels,
  ComCtrls, Constants,
  ScoreBoard, frmScoreBoard, XPMan, frmLevelsEditor, frmGameBoardEditor;

type

	TGameState = (gsPaused, gsPlaying, gsWaitToStart, gsWon);

  TGameForm = class(TForm)
    Panel1: TPanel;
    chkDoubleSize: TCheckBox;
    Timer1: TTimer;
    pnlGame: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    lblPlayerMoves: TLabel;
    lblBoxMoves: TLabel;
    lblTime: TLabel;
    Shape1: TShape;
    Panel5: TPanel;
    lblLevelNumber: TLabel;
    lblLevelName: TLabel;
    lblGameState: TLabel;
    XPManifest1: TXPManifest;
    btnResetGame: TButton;
    btnScoreBoard: TButton;
    btnRestartLevel: TButton;
    procedure chkDoubleSizeClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnResetGameClick(Sender: TObject);
    procedure btnScoreBoardClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRestartLevelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
  private
	{ Private declarations }

	Fblinkstate : boolean;
	FGameState : TGameState;
	TotalGameTime : integer;
	TotalPlayerMoves : integer;
	TotalBoxMoves : integer;

	CurrentLevelIndex : integer;
	GameGrid : TGameGrid;
	GameLevels : TGameLevels;

	procedure set_GameState(newstate : TGameState);
	
	procedure GameGridOnAutoCenter(Sender: TObject);
	procedure GameGridOnWin(sender : TObject);
	procedure GameGridOnPlayerMoved
	(
		Sender : TGameGrid;
		direction : TDirection;
		boxmoved : boolean
	);

	property GameState : TGameState
		read FGameState write set_GameState;

    procedure UpdateGameStateLabels;

	procedure LoadLevel(index : integer);
	procedure ResetGame();

	function CalcScores() : real;
	
	procedure ShowScoreBoard(newplayername : string = '');
    procedure CenterForm;

  public

	destructor Destroy; override;

    procedure Execute(levelsfilename: string);

  end;

var
  GameForm: TGameForm;

implementation

{$R *.dfm}

destructor TGameForm.Destroy;
begin
	FreeAndNil(self.GameLevels);
	inherited;
end;

procedure TGameForm.LoadLevel(index : integer);
begin

	ChDir(ExtractFilePath(Application.ExeName));
	Deserialize(self.GameGrid.GameBoard, GameLevels[index].FileName);
	self.GameGrid.RefreshFromBoard();

	self.CurrentLevelIndex := index;

	self.GameState := gsWaitToStart;
end;

procedure TGameForm.ResetGame();
begin
	TotalGameTime := 0;
	TotalPlayerMoves := 0;
	TotalBoxMoves := 0;
	self.Shape1.Visible := false;

	LoadLevel(0);
end;

procedure TGameForm.Execute(levelsfilename : string);
begin

	ChDir(ExtractFilePath(Application.ExeName));
	Deserialize(GameLevels, levelsfilename);

	ResetGame();

	self.Timer1.Enabled := true;
	self.UpdateGameStateLabels();
	self.CenterForm();
	try
		self.ShowModal();
	finally
		self.Timer1.Enabled := false;
	end;
end;

procedure TGameForm.chkDoubleSizeClick(Sender: TObject);
begin
	if (self.chkDoubleSize.Checked) then
		self.GameGrid.Zoom := 2
	else
		self.GameGrid.Zoom := 1;
end;

procedure TGameForm.CenterForm();
begin
	if (self.Monitor <> nil) then
	begin
		self.Left := (self.Monitor.Width - self.Width) div 2;
		self.Top := (self.Monitor.Height - self.Height) div 2;
	end;
end;

procedure TGameForm.GameGridOnAutoCenter(Sender: TObject);
begin
	self.pnlGame.Constraints.MinWidth := self.GameGrid.Width + 20;
	self.pnlGame.Constraints.MinHeight := self.GameGrid.Height + 20;

	if (self.Visible) then
	begin
		self.Width := 0;
		self.Height := 0;
		CenterForm();
	end;
end;

procedure TGameForm.Timer1Timer(Sender: TObject);
begin
	self.Fblinkstate := not Fblinkstate;

	if (self.GameState = gsPlaying) then
		self.TotalGameTime := self.TotalGameTime + 1;

	UpdateGameStateLabels();
end;

procedure TGameForm.UpdateGameStateLabels();
begin
	if (GameLevels<>nil) 
		and (CurrentLevelIndex>=0) 
		and (CurrentLevelIndex<GameLevels.Count) then
	begin
		self.lblLevelName.Caption := GameLevels[CurrentLevelIndex].Description;

		self.lblLevelNumber.Caption := 'level ' +
			IntToStr(self.CurrentLevelIndex+1) +
			'/' + IntToStr(self.GameLevels.Count);

	end else begin
		self.lblLevelName.Caption := '';
		self.lblLevelNumber.Caption := '';
	end;

	if (self.GameState <> gsWaitToStart) or (self.CurrentLevelIndex>0) then
	begin
		self.Shape1.Visible := true;

		self.lblTime.Caption := IntToStr(self.TotalGameTime) + ' seconds elapsed';
		self.lblPlayerMoves.Caption := 'Player moved ' + IntToStr(self.TotalPlayerMoves) + ' times';
		self.lblBoxMoves.Caption := 'Boxes moved ' + IntToStr(self.TotalBoxMoves) + ' times';

	end else begin

		self.Shape1.Visible := false; 
		self.lblTime.Caption := '';
		self.lblPlayerMoves.Caption := '';
		self.lblBoxMoves.Caption := '';
	end;

	if (self.GameGrid.GameBoard<>nil) and (self.GameGrid.GameBoard.Ready) then
	begin
		case self.GameState of
			gsPaused :
				begin
					self.lblGameState.Font.Color := clNavy;
					self.lblGameState.Caption := 'paused';
				end;

			gsPlaying :
				begin
					self.lblGameState.Caption := 'playing';

					if (self.Fblinkstate) then
						self.lblGameState.Font.Color := clRed
					else
						self.lblGameState.Font.Color := clMaroon;
				end;

			gsWaitToStart :
				begin
					self.lblGameState.Font.Color := clBlack;
					self.lblGameState.Caption := 'do your first move to start';
				end;

			gsWon :
				begin
					if (self.Fblinkstate) then
						self.lblGameState.Font.Color := clLime
					else
						self.lblGameState.Font.Color := clGreen;
					self.lblGameState.Caption := 'YOU WON!';
				end;
		end;

	end else begin

		self.lblGameState.Caption := '';

	end;

end;

procedure TGameForm.GameGridOnPlayerMoved(Sender: TGameGrid;
  direction: TDirection; boxmoved: boolean);
begin
	self.TotalPlayerMoves := self.TotalPlayerMoves + 1;

	if (boxmoved) then
		self.TotalBoxMoves := self.TotalBoxMoves + 1;

	self.GameState := gsPlaying;
	UpdateGameStateLabels();
end;

procedure TGameForm.GameGridOnWin(sender: TObject);
	var s : string;
	var playername : string;
	var stopaskingname : boolean;
begin
	if (self.CurrentLevelIndex < self.GameLevels.Count-1) then
	begin

		self.GameState := gsPaused;

		ShowMessage('You won this level! Press OK to access next level');

		self.LoadLevel(self.CurrentLevelIndex + 1);

	end else begin

		playername := '';
		stopaskingname := false;

		self.GameState := gsWon;

		repeat

			s := InputBox
			(
				'YOU WON!',
				'You won, hero!' + chr(13) +
				'I''m sure that in a near future your name will be written ' +
				'in history books!' + chr(13) +
				'But in the meantime, write down it here!' + chr(13),
				''
			);

			if (length(s)>0) then
			begin
				playername := ValidatePlayerName(s);
				if (length(playername)>0) then
					stopaskingname := true;
			end else
				stopaskingname := true;

		until (stopaskingname);

		ShowScoreBoard(playername);
		
		self.ResetGame();
	end;
end;

function TGameForm.CalcScores: real;
begin
	result := self.TotalBoxMoves + self.TotalPlayerMoves;
end;

procedure TGameForm.ShowScoreBoard(newplayername : string = '');
	var nindex : integer;
	var newitem : TScoreBoardItem;
	var scoreboard : TScoreBoard;
	var oldgamestate : TGameState;
begin

	oldgamestate := self.GameState;

	try

		if (self.GameState <> gsWon) and (self.GameState <> gsPaused) then
		begin
			self.GameState := gsPaused;
		end;
													   
		scoreboard := TScoreBoard.Create();

		try

			ChDir(ExtractFilePath(Application.ExeName));
			if (FileExists(XMLFileName_ScoreBoard)) then
				Deserialize(scoreboard, XMLFileName_ScoreBoard);

			if (length(newplayername) > 0) then
			begin
				nindex := -1;

				newitem := TScoreBoardItem.Create(newplayername, self.CalcScores);
				newitem.BoxMoves := self.TotalBoxMoves;
				newitem.PlayerMoves := self.TotalPlayerMoves;
				newitem.GameTime := self.TotalGameTime;
				
				try
					nindex := scoreboard.Add(newitem);

					if (nindex>=0) then
						Serialize(scoreboard, XMLFileName_ScoreBoard);
				
				finally
					if (nindex<0) then
						FreeAndNil(newitem);
				end;

			end;

			ScoreBoardForm.Execute(scoreboard);
		
		finally
			FreeAndNil(scoreboard);
		end;

	finally
		self.GameState := oldgamestate;
	end;
end;

procedure TGameForm.btnRestartLevelClick(Sender: TObject);
	var oldgamestate : TGameState;
begin

	if (self.CurrentLevelIndex=0) then
		btnResetGameClick(sender)
	else begin

		oldgamestate := self.GameState;

		if (self.GameState <> gsWon) and (self.GameState <> gsPaused) then
		begin
			self.GameState := gsPaused;
		end;

		if (MessageDlg(
			'Are you sure you wanna restart this level?',
			mtConfirmation,
			[mbYes, mbNo],
			0)) = mrYes then
		begin
			self.LoadLevel(self.CurrentLevelIndex);
		end else
		begin
			self.GameState := oldgamestate;
		end;
	end;
end;

procedure TGameForm.btnResetGameClick(Sender: TObject);
	var oldgamestate : TGameState;
begin
	oldgamestate := self.GameState;

	if (self.GameState <> gsWon) and (self.GameState <> gsPaused) then
	begin
		self.GameState := gsPaused;
	end;

	if (MessageDlg(
		'Are you sure you wanna restart this game?',
		mtConfirmation,
		[mbYes, mbNo],
		0)) = mrYes then
	begin
		self.ResetGame();
	end else
	begin
		self.GameState := oldgamestate;
	end;
end;

procedure TGameForm.set_GameState(newstate: TGameState);
begin

	if (newstate <> self.FGameState) then
	begin
		self.FGameState := newstate;
		UpdateGameStateLabels();
	end;
end;

procedure TGameForm.btnScoreBoardClick(Sender: TObject);
begin
	self.ShowScoreBoard();
end;

procedure TGameForm.FormCreate(Sender: TObject);
begin
	self.GameGrid := TGameGrid.Create(self.pnlGame);
	self.GameGrid.Parent := self.pnlGame;
	self.GameGrid.TabOrder := 0;
	self.GameGrid.Centered := true;

	self.GameGrid.OnAutoCenter := GameGridOnAutoCenter;
	self.GameGrid.OnPlayerWin := self.GameGridOnWin;
	self.GameGrid.OnPlayerMoved := self.GameGridOnPlayerMoved;

	self.GameState := gsWaitToStart;

	self.GameGrid.SetGameBoard(TGameBoard.Create, true);

	self.GameLevels := TGameLevels.Create;

	self.GameGrid.GameBoard.Clear();

	self.UpdateGameStateLabels;
end;

procedure TGameForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	if (self.GameGrid<>nil) and (self.GameGrid.GameBoard <> nil) then
	begin
		self.GameGrid.GameBoard.Clear();
	end;
end;

procedure TGameForm.FormActivate(Sender: TObject);
begin
	self.GameGrid.SetFocus();
end;

end.

