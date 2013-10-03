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


unit GameCellStyle;

interface

uses
  SysUtils, Variants, Classes, Graphics, Math, Contnrs, Types, GClasses,
  xmldom, XMLIntf, msxmldom, XMLDoc, GameEngine, GameItemStyle, GamePicture,
  GamePictureInPicture;

type
	TGameCellStyle = class(TGameItemStyle)
	private

		FBoxInCellPicture : TGamePictureInPicture;
		FPlayerInCellPicture : TGamePictureInPicture;
		function get_BoxPicture: TGamePicture;
		function get_PlayerPicture: TGamePicture;
    procedure set_BoxPicture(const Value: TGamePicture);
    procedure set_PlayerPicture(const Value: TGamePicture);

	protected
	public

		property BoxInCellPicture : TGamePictureInPicture
			read FBoxInCellPicture;

		property PlayerInCellPicture : TGamePictureInPicture
			read FPlayerInCellPicture;

		property PlayerPicture : TGamePicture
			read get_PlayerPicture write set_PlayerPicture;

		property BoxPicture : TGamePicture
			read get_BoxPicture write set_BoxPicture;

		constructor Create();
		destructor Destroy; override;
	end;

implementation

{ TGameCellStyle }

constructor TGameCellStyle.Create();
begin
	self.FBoxInCellPicture := TGamePictureInPicture.Create;
	self.FPlayerInCellPicture := TGamePictureInPicture.Create;

	self.FBoxInCellPicture.BackPic := self;
	self.FPlayerInCellPicture.BackPic := self;
end;

destructor TGameCellStyle.Destroy;
begin

	FreeAndNil(self.FBoxInCellPicture);
	FreeAndNil(self.FPlayerInCellPicture);

	inherited;
end;

function TGameCellStyle.get_BoxPicture: TGamePicture;
begin
	result := self.FBoxInCellPicture.ForePic;
end;

function TGameCellStyle.get_PlayerPicture: TGamePicture;
begin
	result := self.FPlayerInCellPicture.ForePic;
end;

procedure TGameCellStyle.set_BoxPicture(const Value: TGamePicture);
begin
	self.FBoxInCellPicture.ForePic := Value;
end;

procedure TGameCellStyle.set_PlayerPicture(const Value: TGamePicture);
begin
	self.FPlayerInCellPicture.ForePic := Value;
end;

end.

