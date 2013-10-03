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


unit frmScoreBoard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, ScoreBoard, GClasses;

type
  TScoreBoardForm = class(TForm)
    Panel1: TPanel;
    btnClose: TButton;
    Panel2: TPanel;
    ListView1: TListView;
    Label1: TLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
	
	procedure FillListView(scoreboard : TScoreBoard);

  public
	{ Public declarations }

	procedure Execute(const scoreboardfilename : string); overload;
	procedure Execute(scoreboard : TScoreBoard); overload;

  end;

var
  ScoreBoardForm: TScoreBoardForm;

implementation

{$R *.dfm}

procedure TScoreBoardForm.btnCloseClick(Sender: TObject);
begin
	self.Close();
end;

procedure TScoreBoardForm.Execute(const scoreboardfilename: string);
	var scoreboard : TScoreBoard;
begin
	scoreboard := TScoreBoard.Create;
	try

		ChDir(ExtractFilePath(Application.ExeName));
		if (FileExists(scoreboardfilename)) then
			Deserialize(scoreboard, scoreboardfilename);

		self.FillListView(scoreboard);
	finally
		FreeAndNil(scoreboard);
	end;
	self.ShowModal();
end;

procedure TScoreBoardForm.Execute(scoreboard: TScoreBoard);
begin
	self.FillListView(scoreboard);
	self.ShowModal;
end;

procedure TScoreBoardForm.FillListView(scoreboard: TScoreBoard);
	var li : TListItem;
	var i : integer;
	var itm : TScoreBoardItem;
begin
	self.ListView1.Clear();

	if (scoreboard<>nil) then
	begin
		for i:=0 to scoreboard.Count-1 do
		begin
			itm := scoreboard[i];

			li := self.ListView1.Items.Add();

			li.Caption := IntToStr(i+1);
			li.SubItems.Add(itm.PlayerName);
			li.SubItems.Add(IntToStr(Round(itm.Scores)));
			li.SubItems.Add(IntToStr(itm.GameTime));
			li.SubItems.Add(DateToStr(itm.Date));
		
		end;
	end;

end;

procedure TScoreBoardForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	self.ListView1.Clear();
end;

end.

