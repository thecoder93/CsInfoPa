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


unit GameBoard;

interface

uses
  SysUtils, Variants, Classes, Graphics, Math, Contnrs, Types, GClasses,
  xmldom, XMLIntf, msxmldom, XMLDoc, GameEngine, GameBoardStyle;

type

	TGameBoard = class(TSerializable)
	private

		FEngine : TGameEngine;
		FStyle : TGameBoardStyle;

	protected
	public

		function Ready : boolean;

		property Engine : TGameEngine read FEngine;
		property Style : TGameBoardStyle read FStyle;

		procedure Clear; override;

		constructor Create;
		destructor Destroy; override;

		procedure Serialize(node : IXMLNode); override;
		procedure Deserialize(node : IXMLNode); override;
	
	end;
  
implementation

{ TGameBoard }

procedure TGameBoard.Clear;
begin
	inherited;
	self.Engine.Clear();
	self.Style.Clear();
end;

constructor TGameBoard.Create;
begin
	inherited Create;

	self.FEngine := TGameEngine.Create;
	self.Fstyle := TGameBoardStyle.Create;
end;

procedure TGameBoard.Serialize(node: IXMLNode);
begin
	inherited;

	self.Style.Serialize(node.AddChild('style'));
	self.Engine.Serialize(node.AddChild('map'));
end;

procedure TGameBoard.Deserialize(node: IXMLNode);
	var cnode : IXMLNode;
begin
	inherited;

	cnode := node.ChildNodes.FindNode('style');
	if (cnode<>nil) then
		self.Style.Deserialize(cnode);

	cnode := node.ChildNodes.FindNode('map');
	if (cnode=nil) then
		raise Exception.Create('map node not found');

	self.Engine.Deserialize(cnode);
end;

destructor TGameBoard.Destroy;
begin
	FreeAndNil(FEngine);
	FreeAndNil(FStyle);
	inherited;
end;

function TGameBoard.Ready: boolean;
begin
	result := (self.FEngine<>nil)
		and (self.FEngine.Width>0)
		and (self.FEngine.Height>0);
end;

end.

