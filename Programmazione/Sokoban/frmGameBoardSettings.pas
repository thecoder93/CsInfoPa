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


unit frmGameBoardSettings;

interface

uses
  SysUtils, Variants, Classes, Graphics, Math, Contnrs, Types, GClasses,
  xmldom, XMLIntf, msxmldom, XMLDoc, GameEngine, GameBoard, GameBoardStyle,
  Spin, ExtCtrls, Dialogs, StdCtrls, Controls, Forms, Buttons;

type
  TGameBoardSettingsForm = class(TForm)
    ScrollBox1: TScrollBox;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    numCellSize: TSpinEdit;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    btnFreeColor: TButton;
    txtFreePicture: TEdit;
    chkDoubleBuffer: TCheckBox;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    btnWallColor: TButton;
    txtWallPicture: TEdit;
    GroupBox5: TGroupBox;
    Label7: TLabel;
    btnGoalColor: TButton;
    txtGoalPicture: TEdit;
    GroupBox7: TGroupBox;
    Label9: TLabel;
    btnBoxColor: TButton;
    txtBoxPicture: TEdit;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    numRows: TSpinEdit;
    numColumns: TSpinEdit;
	ColorDialog1: TColorDialog;
    btnCancel: TButton;
    btnOK: TButton;
    pnlWallColor: TPanel;
    pnlFreeColor: TPanel;
    pnlGoalColor: TPanel;
    pnlBoxColor: TPanel;
    GroupBox6: TGroupBox;
    Label8: TLabel;
    btnPlayerColor: TButton;
    txtPlayerPicture: TEdit;
    pnlPlayerColor: TPanel;
    chkVisibleGridLines: TCheckBox;
    procedure btnWallColorClick(Sender: TObject);
    procedure btnFreeColorClick(Sender: TObject);
    procedure btnGoalColorClick(Sender: TObject);
    procedure btnBoxColorClick(Sender: TObject);
    procedure btnPlayerColorClick(Sender: TObject);
  private
	{ Private declarations }
	procedure LoadFromBoard(gameboard : TGameBoard; canmodifyboardsize : boolean);
	procedure SaveToBoard(gameboard: TGameBoard;
      canmodifyboardsize: boolean);

  public
	function Execute(gameboard : TGameBoard; canmodifyboardsize : boolean) : boolean;
  end;

var
  GameBoardSettingsForm: TGameBoardSettingsForm;

implementation

{$R *.dfm}

procedure TGameBoardSettingsForm.SaveToBoard(gameboard : TGameBoard; canmodifyboardsize : boolean);
begin
	if (canmodifyboardsize) then
	begin

		gameboard.Clear;

		if
			(self.numRows.Value<>gameboard.Engine.Height) and
			(self.numColumns.Value<>gameboard.Engine.Width)  then
		begin
			gameboard.Engine.SetSize
			(
				self.numColumns.Value,
				self.numRows.Value
			);
		end;
	end;

	GameBoard.Style.ShowGridLines := self.chkVisibleGridLines.Checked;
	
	gameboard.Style.CellSizeInPixel := self.numCellSize.Value;
	gameboard.Style.DoubleBuffered := self.chkDoubleBuffer.Checked;

	gameboard.Style.CellStyle[sckWall].Color := self.pnlWallColor.Color;
	gameboard.Style.CellStyle[sckWall].PictureFile := self.txtWallPicture.Text;

	gameboard.Style.CellStyle[sckFree].Color := self.pnlFreeColor.Color;
	gameboard.Style.CellStyle[sckFree].PictureFile := self.txtFreePicture.Text;

	gameboard.Style.CellStyle[sckGoal].Color := self.pnlGoalColor.Color;
	gameboard.Style.CellStyle[sckGoal].PictureFile := self.txtGoalPicture.Text;

	gameboard.Style.BoxStyle.Color := self.pnlBoxColor.Color;
	gameboard.Style.BoxStyle.PictureFile := self.txtBoxPicture.Text;

	gameboard.Style.PlayerStyle.Color := self.pnlPlayerColor.Color;
	gameboard.Style.PlayerStyle.PictureFile := self.txtPlayerPicture.Text;
end;

procedure TGameBoardSettingsForm.LoadFromBoard(GameBoard : TGameBoard; canmodifyboardsize : boolean);
begin
	self.numColumns.Enabled := canmodifyboardsize;
	self.numRows.Enabled := canmodifyboardsize;
	self.numColumns.Value := GameBoard.Engine.Width;
	self.numRows.Value := GameBoard.Engine.Height;

	self.numCellSize.Value := GameBoard.Style.CellSizeInPixel;

	self.chkVisibleGridLines.Checked := GameBoard.Style.ShowGridLines;

	self.pnlWallColor.ParentColor := false;
	self.pnlWallColor.ParentBackground := false;
	self.pnlWallColor.Color := GameBoard.Style.CellStyle[sckWall].Color;
	self.txtWallPicture.Text := GameBoard.Style.CellStyle[sckWall].PictureFile;

	self.pnlFreeColor.ParentColor := false;
	self.pnlFreeColor.ParentBackground := false;
	self.pnlFreeColor.Color := GameBoard.Style.CellStyle[sckFree].Color;
	self.txtFreePicture.Text := GameBoard.Style.CellStyle[sckFree].PictureFile;

	self.pnlGoalColor.ParentColor := false;
	self.pnlGoalColor.ParentBackground := false;
	self.pnlGoalColor.Color := GameBoard.Style.CellStyle[sckGoal].Color;
	self.txtGoalPicture.Text := GameBoard.Style.CellStyle[sckGoal].PictureFile;

	self.pnlBoxColor.ParentColor := false;
	self.pnlBoxColor.ParentBackground := false;
	self.pnlBoxColor.Color := GameBoard.Style.BoxStyle.Color;
	self.txtBoxPicture.Text := GameBoard.Style.BoxStyle.PictureFile;

	self.pnlPlayerColor.ParentColor := false;
	self.pnlPlayerColor.ParentBackground := false;
	self.pnlPlayerColor.Color := GameBoard.Style.PlayerStyle.Color;
	self.txtPlayerPicture.Text := GameBoard.Style.PlayerStyle.PictureFile;
end;

function TGameBoardSettingsForm.Execute(gameboard : TGameBoard;
  canmodifyboardsize: boolean): boolean;
begin
	if (gameboard=nil) then
		result := false
	else begin

		self.LoadFromBoard(gameboard, canmodifyboardsize);

		result := (self.ShowModal() = mrOk);

		if (result) then
			self.SaveToBoard(gameboard, canmodifyboardsize);

	end;

end;

procedure TGameBoardSettingsForm.btnWallColorClick(Sender: TObject);
begin
	self.ColorDialog1.Color := self.pnlWallColor.Color;
	if (self.ColorDialog1.Execute) then
		self.pnlWallColor.Color := self.ColorDialog1.Color;
end;

procedure TGameBoardSettingsForm.btnFreeColorClick(Sender: TObject);
begin
	self.ColorDialog1.Color := self.pnlFreeColor.Color;
	if (self.ColorDialog1.Execute) then
		self.pnlFreeColor.Color := self.ColorDialog1.Color;
end;

procedure TGameBoardSettingsForm.btnGoalColorClick(Sender: TObject);
begin
	self.ColorDialog1.Color := self.pnlGoalColor.Color;
	if (self.ColorDialog1.Execute) then
		self.pnlGoalColor.Color := self.ColorDialog1.Color;
end;

procedure TGameBoardSettingsForm.btnBoxColorClick(Sender: TObject);
begin
	self.ColorDialog1.Color := self.pnlBoxColor.Color;
	if (self.ColorDialog1.Execute) then
		self.pnlBoxColor.Color := self.ColorDialog1.Color;
end;

procedure TGameBoardSettingsForm.btnPlayerColorClick(Sender: TObject);
begin
	self.ColorDialog1.Color := self.pnlPlayerColor.Color;
	if (self.ColorDialog1.Execute) then
		self.pnlPlayerColor.Color := self.ColorDialog1.Color;
end;

end.

