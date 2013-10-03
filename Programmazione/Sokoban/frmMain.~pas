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

unit frmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, frmScoreBoard, frmGame, frmLevelsEditor,
  Constants;

type
  TMainForm = class(TForm)
    Image1: TImage;
    Panel2: TPanel;
    btnQuit: TButton;
    btnLevelsEditor: TButton;
    btnScoreBoard: TButton;
    btnPlayGame: TButton;
    procedure btnQuitClick(Sender: TObject);
    procedure btnPlayGameClick(Sender: TObject);
    procedure btnLevelsEditorClick(Sender: TObject);
    procedure btnScoreBoardClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses frmGameBoardEditor;

{$R *.dfm}

procedure TMainForm.btnQuitClick(Sender: TObject);
begin
	self.Close();
end;

procedure TMainForm.btnPlayGameClick(Sender: TObject);
begin
	self.Visible := false;
	try
		GameForm.Execute(XMLFileName_Levels);
	finally
		self.Visible := true;
	end;
end;

procedure TMainForm.btnLevelsEditorClick(Sender: TObject);
begin
	self.Visible := false;
	try
		LevelsEditorForm.Execute(XMLFileName_Levels);
	finally
		self.Visible := true;
	end;
end;

procedure TMainForm.btnScoreBoardClick(Sender: TObject);
begin
	ScoreBoardForm.Execute(XMLFileName_ScoreBoard);
end;

end.

