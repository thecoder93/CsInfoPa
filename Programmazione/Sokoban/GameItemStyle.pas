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


unit GameItemStyle;

interface

uses
  SysUtils, Variants, Classes, Graphics, Math, Contnrs, Types, GClasses,
  xmldom, XMLIntf, msxmldom, XMLDoc, GameEngine, GamePicture;

type
	TGameItemStyle = class(TGamePicture)
	private
		FPictureFile : string;
		FCreatePicIfNil : boolean;
		FColor  : TColor;
    procedure set_CreatePicIfNil(const Value: boolean);
    procedure set_Color(const Value: TColor);
	protected

		function get_Picture: TPicture; override;
		function LoadPicture : TPicture; override;
		procedure set_PictureFile(const Value: string); virtual;
	
	public
		procedure Serialize(node : IXMLNode); override;
		procedure Deserialize(node : IXMLNode); override;

		constructor Create;

		property CreatePicIfNil : boolean
			read FCreatePicIfNil write set_CreatePicIfNil;
		
		property PictureFile : string
			read FPictureFile write set_PictureFile;

		property Color : TColor
			read FColor write set_Color;
	end;

implementation

{ TGameItemStyle }

constructor TGameItemStyle.Create;
begin
	inherited;

	self.FPictureFile := '';
	self.FColor := clBlack;
	self.FCreatePicIfNil := false;
end;

procedure TGameItemStyle.Serialize(node: IXMLNode);
	var cnode : IXMLNode;
begin
	inherited;

	node.AddChild('color').NodeValue := '$' + IntToHex(self.Color, 6);

	cnode := node.AddChild('bitmap');
	if (length(self.PictureFile)>0) then
		cnode.NodeValue := self.PictureFile;
end;

procedure TGameItemStyle.Deserialize(node: IXMLNode);
	var cnode : IXMLNode;
begin
	inherited;

	cnode := node.ChildNodes.FindNode('color');
	if (cnode<>nil) then
		self.Color := StrToInt(cnode.NodeValue);

	cnode := node.ChildNodes.FindNode('bitmap');
	if (cnode<>nil) then
	begin
		if (VarIsNull(cnode.NodeValue)) then
			self.PictureFile := ''
		else
			self.PictureFile := cnode.NodeValue;
	end;
	
end;

function TGameItemStyle.LoadPicture: TPicture;
begin
	result := nil;

	if (FileExists(self.FPictureFile)) then
	begin
		result := TPicture.Create;

		try

			result.LoadFromFile(self.FPictureFile);

		except

			// Destroy object and ignore exception
			FreeAndNil(result);

		end;

	end;
end;

procedure TGameItemStyle.set_PictureFile(const Value: string);
	var s : string;
begin

	s := UpperCase(trim(Value));
	if (s<>FPictureFile) then
	begin
		FPictureFile := s;
		self.InvalidatePicture();
	end;

end;

procedure TGameItemStyle.set_CreatePicIfNil(const Value: boolean);
begin
	if (FCreatePicIfNil <> Value) then
	begin
		FCreatePicIfNil := value;
		self.InvalidatePicture();
	end;
end;

function TGameItemStyle.get_Picture: TPicture;
begin
	result := inherited get_Picture();

	if (self.FCreatePicIfNil) and (result=nil) then
	begin
		result := TPicture.Create;

		result.Bitmap.PixelFormat := pf24bit;
		result.Bitmap.Width := 1;
		result.Bitmap.Height := 1;
		result.Bitmap.Canvas.Pixels[0, 0] := self.Color;
		result.Bitmap.Transparent := false;

		self.TransparentPicture := false;

		self.SetPicture(result);
	end;

end;

procedure TGameItemStyle.set_Color(const Value: TColor);
begin
	if (Value <> FColor) then
	begin
		FColor := Value;
		if (self.CreatePicIfNil) then
			self.InvalidatePicture();
	end;
end;

end.

