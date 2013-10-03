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


unit GamePicture;

interface

uses
  SysUtils, Variants, Classes, Graphics, Math, Contnrs, Types, GClasses,
  xmldom, XMLIntf, msxmldom, XMLDoc, GameEngine;

type
	TGamePicture = class(TSerializable)
	private
		FPicture : TPicture;
		FLastPicVersion : integer;
		FPictureVersion : integer;
		FTransparentPicture : boolean;

		procedure set_TransparentPicture(const Value: boolean);
		function get_PictureInvalidated: boolean;
	    function get_HasPicture: boolean;

	protected

		function get_Picture: TPicture; virtual;
		function LoadPicture : TPicture; virtual; abstract;
		procedure SetPicture(apicture : TPicture); virtual;
		procedure Validate(); virtual;

	public

		property HasPicture : boolean
			read get_HasPicture;
	
		property TransparentPicture : boolean
			read FTransparentPicture write set_TransparentPicture;

		procedure InvalidatePicture(); virtual;

		property PictureInvalidated : boolean
			read get_PictureInvalidated;

		property PictureVersion : integer
			read FPictureVersion;

		property Picture : TPicture read get_Picture;

		constructor Create;
		destructor Destroy; override;

	end;

implementation

{ TSPicture }

procedure TGamePicture.Validate();
begin
	self.FLastPicVersion := self.PictureVersion;
end;

constructor TGamePicture.Create;
begin
	self.FPicture := nil;
	self.FLastPicVersion := 0;
	self.FPictureVersion := 1;
end;

destructor TGamePicture.Destroy;
begin
	FreeAndNil(self.FPicture);
end;

function TGamePicture.get_Picture: TPicture;
begin
	if (self.PictureInvalidated) then
	begin

		self.Validate();
	
		FreeAndNil(FPicture);

		FPicture := self.LoadPicture();

		if (FPicture<>nil) and (FPicture.Bitmap <> nil) and (self.TransparentPicture) then
		begin
			FPicture.Bitmap.Transparent := true;
			FPicture.Bitmap.TransparentColor := clFuchsia;
			FPicture.Bitmap.TransparentMode := tmFixed;
		end;

	end;

	result := FPicture;
end;

function TGamePicture.get_PictureInvalidated: boolean;
begin
	result := self.FPictureVersion <> self.FLastPicVersion;
end;

procedure TGamePicture.InvalidatePicture;
begin
	self.FPictureVersion := self.FPictureVersion + 1;
	FreeAndNil(FPicture);
end;

procedure TGamePicture.set_TransparentPicture(const Value: boolean);
begin
	if (FTransparentPicture <> Value) then
	begin
		FTransparentPicture := Value;
		self.InvalidatePicture();
	end;
end;

function TGamePicture.get_HasPicture: boolean;
begin
	result := self.Picture <> nil;
end;

procedure TGamePicture.SetPicture(apicture: TPicture);
begin
	self.InvalidatePicture();

	FreeAndNil(self.FPicture);
	self.FPicture := apicture;

	self.Validate();
end;

end.

