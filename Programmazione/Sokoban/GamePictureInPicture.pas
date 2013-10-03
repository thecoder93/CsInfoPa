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


unit GamePictureInPicture;

interface

uses
  SysUtils, Variants, Classes, Graphics, Math, Contnrs, Types, GClasses,
  xmldom, XMLIntf, msxmldom, XMLDoc, GameEngine, GameItemStyle, GamePicture;

type
	TGamePictureInPicture = class(TGameItemStyle)
	private
		FBackPicVersion : integer;
		FForePicVersion : integer;

		FBackPic : TGamePicture;
		FForePic : TGamePicture;

		procedure set_BackPic(const Value: TGamePicture);
		procedure set_ForePic(const Value: TGamePicture);
		
	protected

		function get_Picture: TPicture; override;
		function LoadPicture() : TPicture; override;
	
	public

		property BackPic : TGamePicture
			read FBackPic write set_BackPic;

		property ForePic : TGamePicture
			read FForePic write set_ForePic;
			
		constructor Create();
		destructor Destroy; override;
	end;

implementation

function DrawPictureInPicture(cellpic, spritepic : TPicture) : TPicture;
	var r : TRect;
begin
	if (cellpic=nil) or (spritepic=nil) then
		result := nil
	else begin
		result := TPicture.Create();
		result.Bitmap.PixelFormat := pf24bit;
		result.Bitmap.Width := max(cellpic.Width, spritepic.Width);
		result.Bitmap.Height :=  max(cellpic.Height, spritepic.Height);

		r.Left := 0;
		r.Top := 0;
		r.Right := result.Bitmap.Width;
		r.Bottom := result.Bitmap.Height;

		// Draw background
		result.Bitmap.Canvas.StretchDraw(r, cellpic.Graphic);

		// Draw foreground
		result.Bitmap.Canvas.StretchDraw(r, spritepic.Graphic);
	end;
end;

{ TGamePictureInPicture }

constructor TGamePictureInPicture.Create;
begin
	inherited;
	self.FBackPicVersion := -1;
	self.FForePicVersion := -1;
	self.FBackPic := nil;
	self.FForePic := nil;
end;

destructor TGamePictureInPicture.Destroy;
begin
	self.FBackPic := nil;
	self.FForePic := nil;

	inherited;
end;

function TGamePictureInPicture.get_Picture: TPicture;
	var reload : boolean;
begin
	result := nil;

	if (self.FBackPic<>nil) and (self.fforepic<>nil) then
	begin

		if (self.fforepic.TransparentPicture) then
		begin

			reload := false;

			if (self.FBackPic.PictureVersion <> self.FBackPicVersion) then
			begin
				self.FBackPicVersion := self.FBackPic.PictureVersion;
				reload := true;
			end;

			if (self.FForePic.PictureVersion <> self.FForePicVersion) then
			begin
				self.FForePicVersion := self.FForePic.PictureVersion;
				reload := true;
			end;

			if (reload)	then
				self.InvalidatePicture();

			result := inherited get_Picture();
		end;
	end;
end;

function TGamePictureInPicture.LoadPicture: TPicture;
begin
	if (self.FBackPic = nil) or (self.FForePic = nil) then
		result := nil
	else
		result := DrawPictureInPicture(self.FBackPic.Picture, self.FForePic.Picture);
end;

procedure TGamePictureInPicture.set_BackPic(const Value: TGamePicture);
begin
	if (FBackPic <> Value) then
	begin
		FBackPic := Value;

		if (FBackPic<>nil) then
			self.FBackPicVersion := FBackPic.PictureVersion - 1
		else
			self.FBackPicVersion := -1
	end;
end;

procedure TGamePictureInPicture.set_ForePic(const Value: TGamePicture);
begin
	if (FForePic <> Value) then
	begin
		FForePic := Value;

		if (FForePic<>nil) then
			self.FForePicVersion := FForePic.PictureVersion - 1
		else
			self.FForePicVersion := -1
	end;
end;

end.

