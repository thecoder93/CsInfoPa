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


unit frmGameBoardEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, GameGrid, Grids, xmldom, XMLIntf, msxmldom,
  XMLDoc, GameEngine, GameBoardStyle, GameBoard, GClasses, Buttons, GameLevels,
  ComCtrls, ScoreBoard, frmGameBoardSettings, Spin;

type
	TGameBoardEditorForm = class(TForm)
    Panel3: TPanel;
    cmbObjectToPlace: TComboBox;
    Label1: TLabel;
    btnSettings: TButton;
    btnNew: TButton;
    btnLoad: TButton;
    btnSaveAs: TButton;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    numZoom: TSpinEdit;
    Label2: TLabel;
    ScrollBox: TScrollBox;
    procedure FormCreate(Sender: TObject);
    procedure btnSettingsClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure btnSaveAsClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure numZoomChange(Sender: TObject);
	private

		FFileName : string;
		GameGrid : TGameGrid;

		procedure GameGridOnMouseDown(Sender: TObject; Button: TMouseButton;
		  Shift: TShiftState; X, Y: Integer);

		procedure GameGridOnMouseMove(Sender: TObject; Shift: TShiftState;
		    X, Y: Integer);

		function get_GameBoard: TGameBoard;
  		procedure PlaceObject(mousex, mousey: integer);

	public

		property FileName : string
			read FFileName;
	
		property GameBoard : TGameBoard
			read get_GameBoard;

		function Execute(openfile : string = '') : string;

	end;

var
  GameBoardEditorForm: TGameBoardEditorForm;

implementation

{$R *.dfm}

function TGameBoardEditorForm.Execute(openfile : string = '') : string;
begin

	self.GameGrid.SetGameBoard(TGameBoard.Create, true);

	try

		ChDir(ExtractFilePath(Application.ExeName));

		openfile := trim(openfile);
		FFileName := openfile;

		if (length(openfile)>0) and (FileExists(openfile)) then
		begin

			Deserialize(self.GameBoard, openfile);

			self.GameGrid.RefreshFromBoard();
			self.ShowModal();

		end else if (GameBoardSettingsForm.Execute(self.GameBoard, true)) then
		begin

			self.GameGrid.RefreshFromBoard();
			self.ShowModal();

		end;
		
	finally
		self.GameGrid.SetGameBoard(nil, false);
	end;

	result := FileName;

end;

procedure TGameBoardEditorForm.FormCreate(Sender: TObject);
begin
	self.GameGrid := TGameGrid.Create(self.ScrollBox);
	self.GameGrid.Parent := self.ScrollBox;

	self.GameGrid.TabOrder := 0;

	self.GameGrid.OnMouseDown := self.GameGridOnMouseDown;
	self.GameGrid.OnMouseMove := self.GameGridOnMouseMove;
	self.GameGrid.Centered := false;

end;

procedure TGameBoardEditorForm.btnSettingsClick(Sender: TObject);
begin
	if (GameBoardSettingsForm.Execute(self.GameBoard, false)) then
		self.GameGrid.RefreshFromBoard();
end;

procedure TGameBoardEditorForm.PlaceObject(mousex, mousey : integer);
	var col, row : integer;
	var cell : TGameCell;
	var oldplayerpos : TPoint;
begin
	if (self.GameBoard <> nil) and (self.GameBoard.Ready) then
	begin

		self.GameGrid.MouseToCell(mousex, mousey, col, row);

		if (col>=0) and (row>=0)
			and (col<self.GameBoard.Engine.Width)
			and (row<self.GameBoard.Engine.Height) then
		begin

			cell := self.GameBoard.Engine.Cell[col, row];
		
			case self.cmbObjectToPlace.ItemIndex of

				0 :
					begin
						if (not self.GameBoard.Engine.Player.IsIn(col, row)) then
						begin
							cell.kind := sckWall;
							cell.ContainsBox := false;
							self.GameGrid.InvalidateCell(col, row);
						end;
					end;

				1 :
					begin
						cell.kind := sckFree;
						cell.ContainsBox := false;
						self.GameGrid.InvalidateCell(col, row);
					end;

				2 :
					begin
						cell.kind := sckGoal;
						cell.ContainsBox := false;
						self.GameGrid.InvalidateCell(col, row);
					end;

				3 :
					begin
						cell.ContainsBox := true;
						self.GameGrid.InvalidateCell(col, row);
					end;

				4 :
					begin
						if (cell.Kind <> sckWall) then
						begin
							oldplayerpos := self.GameBoard.Engine.Player.Position;

							self.GameBoard.Engine.Player.SetPosition(col, row);

							self.GameGrid.InvalidateCell
							(
								oldplayerpos.X,
								oldplayerpos.Y
							);
							self.GameGrid.InvalidateCell
							(
								self.GameBoard.Engine.Player.X,
								self.GameBoard.Engine.Player.Y
							);
						end;
					end;
			end;
		
		end;

	end;
end;

procedure TGameBoardEditorForm.GameGridOnMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
	if (Button = mbLeft) then
		PlaceObject(x, y);
end;

procedure TGameBoardEditorForm.GameGridOnMouseMove(
	Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
	if (Shift = [ssLeft]) then
		PlaceObject(x, y);
end;

function TGameBoardEditorForm.get_GameBoard: TGameBoard;
begin
	result := self.GameGrid.GameBoard;
end;

procedure TGameBoardEditorForm.btnNewClick(Sender: TObject);
begin
	if (GameBoardSettingsForm.Execute(gameboard, true)) then
	begin
		self.GameGrid.RefreshFromBoard();
		self.FFileName := '';
	end;
end;

procedure TGameBoardEditorForm.btnLoadClick(Sender: TObject);
begin
	self.SaveDialog1.InitialDir := ExtractFilePath(Application.ExeName);
	if (self.OpenDialog1.Execute) then
	begin
		ChDir(ExtractFilePath(Application.ExeName));

		Deserialize(self.GameBoard, self.OpenDialog1.FileName);
		self.FFileName := self.OpenDialog1.FileName;
		self.GameGrid.RefreshFromBoard();
	end;
end;

procedure TGameBoardEditorForm.btnSaveAsClick(Sender: TObject);
begin
	self.SaveDialog1.InitialDir := ExtractFilePath(Application.ExeName);
	self.SaveDialog1.FileName := FFileName;
	if (self.SaveDialog1.Execute) then
	begin
		Serialize(self.GameBoard, self.SaveDialog1.FileName);
		self.FFileName := ExtractRelativePath
		(
			Application.ExeName,
			self.SaveDialog1.FileName
		);
	end;
end;

procedure TGameBoardEditorForm.Button1Click(Sender: TObject);
begin
	self.Close;
end;

procedure TGameBoardEditorForm.numZoomChange(Sender: TObject);
begin
	self.GameGrid.Zoom := self.numZoom.Value;
end;

end.

