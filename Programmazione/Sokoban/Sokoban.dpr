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
 * distributed with calc under the filename COPYING-LGPL.  You should have
 * received a copy with calc; if not, write to Free Software Foundation, Inc.
 * 59 Temple Place, Suite 330, Boston, MA  02111-1307, USA.
 *
 *
 * Share and enjoy! :-)
}

program Sokoban;

uses
  Forms,
  frmGame in 'frmGame.pas' {GameForm},
  GameLevels in 'GameLevels.pas',
  ScoreBoard in 'ScoreBoard.pas',
  frmScoreBoard in 'frmScoreBoard.pas' {ScoreBoardForm},
  frmGameBoardEditor in 'frmGameBoardEditor.pas' {GameBoardEditorForm},
  frmGameBoardSettings in 'frmGameBoardSettings.pas' {GameBoardSettingsForm},
  frmLevelsEditor in 'frmLevelsEditor.pas' {LevelsEditorForm},
  frmMain in 'frmMain.pas' {MainForm},
  Constants in 'Constants.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'roots sokoban';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TGameForm, GameForm);
  Application.CreateForm(TScoreBoardForm, ScoreBoardForm);
  Application.CreateForm(TGameBoardEditorForm, GameBoardEditorForm);
  Application.CreateForm(TGameBoardSettingsForm, GameBoardSettingsForm);
  Application.CreateForm(TLevelsEditorForm, LevelsEditorForm);
  Application.Run;
end.

