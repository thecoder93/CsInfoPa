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


unit GameBoardStyle;

interface

uses
  SysUtils, Variants, Classes, Graphics, Math, Contnrs, Types, GClasses,
  xmldom, XMLIntf, msxmldom, XMLDoc, GameEngine, GameItemStyle, GameCellStyle;

type
	TGameBoardStyle = class(TSerializable)
	private

		FCellSizeInPixel : integer;

		FCellStyles : array[TGameCellKind] of TGameCellStyle;

		FPlayerStyle : TGameItemStyle;
		FBoxStyle : TGameItemStyle;

		FShowGridLines : boolean;
		FDoubleBuffered : boolean;

		function get_CellStyle(kind : TGameCellKind): TGameCellStyle;
		procedure set_CellSizeInPixel(const Value: integer);

	protected
	public

		property CellSizeInPixel : integer
			read FCellSizeInPixel write set_CellSizeInPixel default 20;

		property CellStyle[kind : TGameCellKind] : TGameCellStyle read get_CellStyle;

		property ShowGridLines : boolean
			read FShowGridLines write FShowGridLines;

		property DoubleBuffered : boolean
			read FDoubleBuffered write FDoubleBuffered;
			
		property BoxStyle : TGameItemStyle read FBoxStyle;
		property PlayerStyle : TGameItemStyle read FPlayerStyle;
			
		constructor Create();
		destructor Destroy; override;

		procedure Clear; override;

		procedure Serialize(node : IXMLNode); override;
		procedure Deserialize(node : IXMLNode); override;
	end;	

implementation

{ TGameBoardStyle }

procedure TGameBoardStyle.set_CellSizeInPixel(const Value: integer);
begin
	if (Value <= 5) then
		self.FCellSizeInPixel := 5
	else
		self.FCellSizeInPixel := Value;
end;


procedure TGameBoardStyle.Clear;
begin
	inherited;

	self.FCellSizeInPixel := 20;

	self.DoubleBuffered := false;

	self.CellStyle[sckWall].Color := clMaroon;
	self.CellStyle[sckWall].PictureFile := 'wall.bmp';

	self.CellStyle[sckFree].Color := clBlack;
	self.CellStyle[sckFree].PictureFile := '';

	self.CellStyle[sckGoal].Color := clGreen;
	self.CellStyle[sckGoal].PictureFile := 'goal.bmp';

	self.BoxStyle.Color := clYellow;
	self.BoxStyle.PictureFile := 'box.bmp';
	self.BoxStyle.TransparentPicture := true;

	self.PlayerStyle.Color := clRed;
	self.PlayerStyle.PictureFile := 'player.bmp';
	self.PlayerStyle.TransparentPicture := true;

	self.ShowGridLines := true;
end;

constructor TGameBoardStyle.Create();
begin
	inherited;

	self.FBoxStyle := TGameItemStyle.Create;
	self.FPlayerStyle := TGameItemStyle.Create;

	self.FCellStyles[sckWall] := TGameCellStyle.Create;
	self.FCellStyles[sckWall].PlayerPicture := self.PlayerStyle;
	self.FCellStyles[sckWall].BoxPicture := self.BoxStyle;

	self.FCellStyles[sckFree] := TGameCellStyle.Create;
	self.FCellStyles[sckFree].PlayerPicture := self.PlayerStyle;
	self.FCellStyles[sckFree].BoxPicture := self.BoxStyle;
	self.FCellStyles[sckFree].CreatePicIfNil := true;

	self.FCellStyles[sckGoal] := TGameCellStyle.Create;
	self.FCellStyles[sckGoal].PlayerPicture := self.PlayerStyle;
	self.FCellStyles[sckGoal].BoxPicture := self.BoxStyle;
	self.FCellStyles[sckGoal].CreatePicIfNil := true;

	Clear();
end;

procedure TGameBoardStyle.Deserialize(node: IXMLNode);
	var cnode : IXMLNode;
begin
	inherited;

	cnode := node.ChildNodes.FindNode('DoubleBuffered');
	if (cnode<>nil) then
		self.DoubleBuffered := cnode.NodeValue;

	cnode := node.ChildNodes.FindNode('ShowGridLines');
	if (cnode<>nil) then
		self.ShowGridLines := cnode.NodeValue;

	cnode := node.ChildNodes.FindNode('CellSizeInPixel');
	if (cnode<>nil) then
		self.CellSizeInPixel := cnode.NodeValue;

	cnode := node.ChildNodes.FindNode('wall');
	if (cnode<>nil) then
		self.FCellStyles[sckWall].Deserialize(cnode);
	
	cnode := node.ChildNodes.FindNode('free');
	if (cnode<>nil) then
		self.FCellStyles[sckFree].Deserialize(cnode);

	cnode := node.ChildNodes.FindNode('goal');
	if (cnode<>nil) then
		self.FCellStyles[sckGoal].Deserialize(cnode);

	cnode := node.ChildNodes.FindNode('player');
	if (cnode<>nil) then
		self.PlayerStyle.Deserialize(cnode);

	cnode := node.ChildNodes.FindNode('box');
	if (cnode<>nil) then
		self.BoxStyle.Deserialize(cnode);
end;

procedure TGameBoardStyle.Serialize(node: IXMLNode);
	var cnode : IXMLNode;
begin
	inherited;

	node.AddChild('DoubleBuffered').NodeValue := self.DoubleBuffered;

	node.AddChild('CellSizeInPixel').NodeValue := self.CellSizeInPixel;

	node.AddChild('ShowGridLines').NodeValue := self.ShowGridLines;

	cnode := node.AddChild('wall');
	self.FCellStyles[sckWall].Serialize(cnode);
	
	cnode := node.AddChild('free');
	self.FCellStyles[sckFree].Serialize(cnode);

	cnode := node.AddChild('goal');
	self.FCellStyles[sckGoal].Serialize(cnode);

	cnode := node.AddChild('player');
	self.PlayerStyle.Serialize(cnode);

	cnode := node.AddChild('box');
	self.BoxStyle.Serialize(cnode);
end;

function TGameBoardStyle.get_CellStyle(kind : TGameCellKind): TGameCellStyle;
begin

	if (kind<>sckWall) and (kind<>sckFree) and (kind<>sckGoal) then
		raise Exception.Create('Invalid cell kind');

	result := self.FCellStyles[kind];
end;

destructor TGameBoardStyle.Destroy;
begin

	FreeAndNil(self.FCellStyles[sckWall]);
	FreeAndNil(self.FCellStyles[sckFree]);
	FreeAndNil(self.FCellStyles[sckGoal]);
	FreeAndNil(self.FPlayerStyle);
	FreeAndNil(self.FBoxStyle);

	inherited;
end;

end.

