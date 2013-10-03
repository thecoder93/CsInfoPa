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


unit frmLevelsEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, GameGrid, Grids, xmldom, XMLIntf, msxmldom,
  XMLDoc, GameEngine, GameBoardStyle, GameBoard, GClasses, Buttons, GameLevels,
  ComCtrls, ScoreBoard, frmScoreBoard, XPMan, frmGameBoardEditor, ValEdit;

type
  TLevelsEditorForm = class(TForm)
    Panel2: TPanel;
    btnDeleteRow: TButton;
    btnOpenInEditor: TButton;
    btnMoveDown: TButton;
    btnMoveUp: TButton;
    btnClear: TButton;
    btnNewMap: TButton;
    btnOk: TButton;
    btnCancel: TButton;
    ValueListEditor1: TValueListEditor;
    procedure btnOkClick(Sender: TObject);
    procedure btnDeleteRowClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnMoveUpClick(Sender: TObject);
    procedure btnMoveDownClick(Sender: TObject);
    procedure btnOpenInEditorClick(Sender: TObject);
    procedure btnNewMapClick(Sender: TObject);
  private

	Ffilename : string;
  
    procedure LoadFromGameLevels(levels: TGameLevels);
    procedure SaveToGameLevels(levels: TGameLevels);
	{ Private declarations }

  public

  	function Execute(const filename : string) : boolean;
  
  end;

var
  LevelsEditorForm: TLevelsEditorForm;

implementation

{$R *.dfm}

{ TForm1 }

function TLevelsEditorForm.Execute(const filename: string): boolean;
	var levels : TGameLevels;
begin
	Ffilename := filename;

	levels := TGameLevels.Create;

	try

		self.ValueListEditor1.Strings.Clear();

		ChDir(ExtractFilePath(Application.ExeName));
		if (FileExists(Ffilename)) then
		begin
			try
				Deserialize(levels, Ffilename);
			except
				on e : Exception do
				begin
					ShowMessage('Error loading ' + filename + chr(13) + e.Message);
				end;
			end;
		end;

		self.LoadFromGameLevels(levels);
		
	finally
		FreeAndNil(levels);
	end;

	result := (self.ShowModal() = mrOk);
end;

procedure TLevelsEditorForm.LoadFromGameLevels(levels : TGameLevels);
	var i : integer;
begin

	self.ValueListEditor1.Strings.Clear();
	for i:=0 to levels.Count-1 do
	begin
		self.ValueListEditor1.InsertRow
		(
			levels[i].FileName,
			levels[i].Description,
			true
		);
	end;

end;

procedure TLevelsEditorForm.SaveToGameLevels(levels : TGameLevels);
	var i : integer;
begin
	if (self.ValueListEditor1.RowCount <= 1) then
		raise Exception.Create('Level list cannot be empty');

	levels.Clear();
	for i:=1 to self.ValueListEditor1.RowCount-1 do
	begin
		levels.Add
		(
			self.ValueListEditor1.Cells[0, i],
			self.ValueListEditor1.Cells[1, i]
		);
	end;
end;

procedure TLevelsEditorForm.btnOkClick(Sender: TObject);
	var levels : TGameLevels;
begin
	levels := TGameLevels.Create;
	try

		SaveToGameLevels(levels);
		Serialize(levels, Ffilename);
		self.ModalResult := mrOk;

	finally
		FreeAndNil(levels);
	end;

end;

procedure TLevelsEditorForm.btnDeleteRowClick(Sender: TObject);
	var i : integer;
begin
	i := self.ValueListEditor1.Selection.Top-1;
	if (i>=0) and (i<self.ValueListEditor1.Strings.Count) then
		self.ValueListEditor1.Strings.Delete(i);
end;

procedure TLevelsEditorForm.btnClearClick(Sender: TObject);
begin
	self.ValueListEditor1.Strings.Clear;
end;

procedure TLevelsEditorForm.btnMoveUpClick(Sender: TObject);
	var i : integer;
begin
	i := self.ValueListEditor1.Selection.Top-1;
	if (i>=1) and (i<self.ValueListEditor1.Strings.Count) then
		self.ValueListEditor1.Strings.Move(i, i-1)
end;

procedure TLevelsEditorForm.btnMoveDownClick(Sender: TObject);
	var i : integer;
begin
	i := self.ValueListEditor1.Selection.Top-1;
	if (i>=0) and (i<self.ValueListEditor1.Strings.Count-1) then
		self.ValueListEditor1.Strings.Move(i, i+1)
end;

procedure TLevelsEditorForm.btnOpenInEditorClick(Sender: TObject);
	var s : string;
	var i : integer;
begin
	i := self.ValueListEditor1.Selection.Top;
	if (i>=1) and (i<self.ValueListEditor1.RowCount) then
	begin
		s := trim(self.ValueListEditor1.Cells[0, i]);
		if (length(s)>0) then
		begin
			if (not FileExists(s)) then
				ShowMessage('File ' + s + ' doesn''t exists')
			else begin
				s := GameBoardEditorForm.Execute(s);
				if (Length(s)>0) then
					self.ValueListEditor1.Cells[0, i] := s;
			end;
		end;
	end;
end;

procedure TLevelsEditorForm.btnNewMapClick(Sender: TObject);
	var s : string;
begin
	s := GameBoardEditorForm.Execute();
	if (length(s)>0) then
	begin
		self.ValueListEditor1.InsertRow(s, 'new map', false);
	end;
end;

end.

