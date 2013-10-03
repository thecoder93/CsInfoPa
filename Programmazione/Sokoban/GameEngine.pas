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


unit GameEngine;

interface

uses
  SysUtils, Variants, Classes, Graphics, Math, Contnrs, Types, GClasses,
  xmldom, XMLIntf, msxmldom, XMLDoc;

type

	TDirection = (dirNone, dirLeft, dirUp, dirRight, dirDown);
	TGameCellKind = (sckWall, sckFree, sckGoal);

	TGameEngine = class;

	TGameObject = class(TSerializable)
	private
		Fowner     : TGameEngine;
	protected
	public

		constructor Create(aowner : TGameEngine);

		property Owner : TGameEngine read FOwner;

	end;

	TGameCell = class(TSerializable)

	private
		FContainsBox : boolean;
		Fkind : TGameCellKind;

		procedure set_ContainsBox(value : boolean);
   		procedure set_Kind(const Value: TGameCellKind);

	protected
	public

		property Kind : TGameCellKind
			read Fkind write set_Kind;
	
		property ContainsBox : boolean
			read FContainsBox write set_ContainsBox;

		procedure Serialize(node : IXMLNode); override;
		procedure Deserialize(node : IXMLNode); override;
		procedure Clear; override;

		constructor Create(aowner : TGameEngine);

	end;

	TGameItem = class(TGameObject)
	private

		Fpos       : TPoint;

		function get_Cell: TGameCell;

	protected
	public

		constructor Create(aowner : TGameEngine); overload;
		constructor Create(aowner : TGameEngine; apos : TPoint); overload;

		function SetPosition(x, y : integer) : boolean; virtual;

		property Position : TPoint read FPos;
		property X : integer read FPos.X;
		property Y : integer read FPos.Y;

		property Cell : TGameCell read get_Cell;

		function IsIn(ax, ay : integer) : boolean;

		procedure Serialize(node : IXMLNode); override;
		procedure Deserialize(node : IXMLNode); override;
		procedure Clear; override;
		
	end;

	TSPlayer = class(TGameItem)
	private
	protected
	public

		function Move(direction : TDirection) : integer;
	
		constructor Create(aowner : TGameEngine); overload;
		constructor Create(aowner : TGameEngine; apos : TPoint); overload;
	end;

	TGameEngine = class(TSerializable)
	private

		Fsize    : TSize;
		Fmatrix  : array of TGameCell;
		Fplayer  : TSPlayer;

		function get_CellByIndex(index : integer) : TGameCell;
		function get_Cell(x, y : integer) : TGameCell;
		function get_CellCount() : integer;

	protected
	public

		function PlayerWon : boolean;
	
		constructor Create;
		destructor Destroy; override;

		function IsValidIndex(i : integer) : boolean;
		function IsValidPosition(x, y : integer) : boolean;

		procedure SetSize(width, height : integer);

		procedure Serialize(node : IXMLNode); override;
		procedure Deserialize(node : IXMLNode); override;
		procedure Clear; override;

		property Width : integer read Fsize.cx;
		property Height : integer read Fsize.cy;
		property MatrixSize : TSize read Fsize;
		property CellCount : integer read get_CellCount;

		property CellByIndex[index : integer] : TGameCell read get_CellByIndex;
		property Cell[x, y : integer] : TGameCell read get_Cell; default;

		property Player : TSPlayer read FPlayer;

	end;

function CalcMove(const p : TPoint; direction : TDirection) : TPoint;

function SCellKindToString(kind : TGameCellKind) : string;
function SCellKindFromString(const s : string) : TGameCellKind;
  
implementation

function SCellKindToString(kind : TGameCellKind) : string;
begin
	case kind of
		sckWall :
			result := 'wall';
		sckFree :
			result := 'free';
		sckGoal :
			result := 'goal';
		else
			raise Exception.Create('Unknown cell kind');
	end;
end;

function SCellKindFromString(const s : string) : TGameCellKind;
	var s1 : string;
begin
	s1 := UpperCase(trim(s));
	if (s1='WALL') then
		result := sckWall
	else if (s1='FREE') then
		result := sckFree
	else if (s1='GOAL') then
		result := sckGoal
	else
		raise Exception.Create('Invalid Cell Kind : ' + s);
end;

function CalcMove(const p : TPoint; direction : TDirection) : TPoint;
begin
	case direction of

		dirLeft :
			begin
				result.X := p.X - 1;
				result.Y := p.Y;
			end;

		dirUp :
			begin
				result.X := p.X;
				result.Y := p.Y - 1;
			end;

		dirRight :
			begin
				result.X := p.X + 1;
				result.Y := p.Y;
			end;

		dirDown :
			begin
				result.X := p.X;
				result.Y := p.Y + 1;
			end;

		dirNone :
			begin
				result := p;
			end;
			
		else
			raise Exception.Create('Invalid direction');
	end;
end;

{ TGameItem }

constructor TGameItem.Create(aowner: TGameEngine);
begin
	inherited Create(aowner);

	Clear();
end;

procedure TGameItem.Clear;
begin
	inherited;

	self.SetPosition(0, 0);
end;

constructor TGameItem.Create(aowner: TGameEngine; apos: TPoint);
begin
	inherited Create(aowner);

	Clear();

	self.Fowner := aowner;
	self.SetPosition(apos.X, apos.Y);
end;

procedure TGameItem.Deserialize(node: IXMLNode);
	var posnode : IXMLNode;
begin
	inherited;

	posnode := node.ChildNodes.FindNode('Position');
	if (posnode=nil) then
		raise Exception.Create('Cannot find node Position');

	self.SetPosition(posnode.Attributes['X'], posnode.Attributes['Y']);
end;

procedure TGameItem.Serialize(node: IXMLNode);
	var posnode : IXMLNode;
begin
	inherited;

	posnode := node.AddChild('Position');
	posnode.Attributes['X'] := self.Fpos.X;
	posnode.Attributes['Y'] := self.Fpos.Y;
end;

function TGameItem.SetPosition(x, y: integer): boolean;
begin
	if ((x<>self.Fpos.X) or (y<>self.Fpos.Y))
		and (Owner.IsValidPosition(x, y)) then
	begin
		self.Fpos.X := x;
		self.Fpos.Y := y;
		result := true;
	end else
		result := false;
end;

function TGameItem.get_Cell: TGameCell;
begin
	result := self.Owner.Cell[self.X, self.Y];
end;

function TGameItem.IsIn(ax, ay: integer): boolean;
begin
	result := (self.X = ax) and (self.Y = ay);
end;

{ TSPlayer }

constructor TSPlayer.Create(aowner: TGameEngine);
begin
	inherited;
end;

constructor TSPlayer.Create(aowner: TGameEngine; apos: TPoint);
begin
	inherited;

end;

function TSPlayer.Move(direction: TDirection) : integer;
	var np, np2 : TPoint;
	var nextcell, nextboxcell : TGameCell;
begin
	np := CalcMove(self.Position, direction);

	result := 0;

	if (self.Owner.IsValidPosition(np.X, np.Y)) then
	begin

		nextcell := self.Owner.Cell[np.X, np.Y];

		if (nextcell.kind <> sckWall) then
		begin

			if (nextcell.ContainsBox) then
			begin

				np2 := CalcMove(np, direction);

				if (self.Owner.IsValidPosition(np2.X, np2.Y)) then
				begin

					nextboxcell := self.Owner.Cell[np2.X, np2.Y];

					if
					(
						(not nextboxcell.ContainsBox)
						and
						(
							(nextboxcell.kind = sckFree)
							or
							(nextboxcell.kind = sckGoal)
						)
					) then
					begin
						if (self.SetPosition(np.X, np.Y)) then
						begin
							nextcell.ContainsBox := false;
							nextboxcell.ContainsBox := true;
							result := 2;
						end;
					end;

				end;
		
			end else
			begin
				if (self.SetPosition(np.X, np.Y)) then
					result := 1;
			end;

		end;
	end;
end;

{ TGameCell }

procedure TGameCell.Clear;
begin
	inherited;
	self.kind := sckWall;
	self.ContainsBox := false;
end;

constructor TGameCell.Create(aowner : TGameEngine);
begin
	inherited Create();
	Clear();
end;

procedure TGameCell.Deserialize(node: IXMLNode);
begin
	inherited;

	if (not node.HasAttribute('kind')) then
		raise Exception.Create('Attribute "kind" not found');

	self.kind := SCellKindFromString(node.Attributes['kind']);
	self.ContainsBox := (node.HasAttribute('box') and (node.Attributes['box']<>0))
end;

procedure TGameCell.Serialize(node: IXMLNode);
begin
	inherited;

	node.Attributes['kind'] := SCellKindToString(self.kind);

	if (self.ContainsBox) then
		node.Attributes['box'] := 1
	else
		node.Attributes['box'] := 0;
end;

procedure TGameCell.set_ContainsBox(value: boolean);
begin
	if (self.kind = sckWall) then
		value := false;

	self.FContainsBox := value;
end;

procedure TGameCell.set_Kind(const Value: TGameCellKind);
begin
	Fkind := Value;

	if (Value = sckWall) then
		self.FContainsBox := false;
end;

{ TGameEngine }

procedure TGameEngine.Clear;
begin
	inherited;

	SetSize(0, 0);
	self.Fplayer.Clear();
end;

function TGameEngine.get_Cell(x, y: integer): TGameCell;
begin
	if (not IsValidPosition(x, y)) then
		raise ERangeError.Create('Coordinates out of matrix bounds');

	result := self.Fmatrix[x + y*self.Fsize.cx];
end;

function TGameEngine.get_CellByIndex(index: integer): TGameCell;
begin
	if (not IsValidIndex(index)) then
		raise ERangeError.Create('Cell index out of bounds');

	result := self.Fmatrix[index];
end;

function TGameEngine.get_CellCount: integer;
begin
	result := self.Fsize.cx * self.Fsize.cy;
end;

procedure TGameEngine.Deserialize(node: IXMLNode);
	var playernode, matrixnode : IXMLNode;
	var j, i, x, y : integer;
	var rownode, cellnode : IXMLNode;
begin
	inherited;

	matrixnode := node.ChildNodes.FindNode('matrix');
	if (matrixnode=nil) then
		raise Exception.Create('matrix node not found');

	self.SetSize(matrixnode.Attributes['width'], matrixnode.Attributes['height']);

	y := 0;
	for j:=0 to matrixnode.ChildNodes.Count-1 do
	begin
		rownode := matrixnode.ChildNodes.Get(j);

		if (rownode.NodeType <> ntComment) then
		begin

			if (rownode.NodeName <> 'row') then
				raise Exception.Create('Inside a row node only c nodes are expected but node ' + cellnode.NodeName + ' was found.');

			x := 0;
			for i:=0 to rownode.ChildNodes.Count-1 do
			begin
				cellnode := rownode.ChildNodes.Get(i);

				if (cellnode.NodeType <> ntComment) then
				begin
				
					if (cellnode.NodeName <> 'c') then
						raise Exception.Create('Inside a row node only c nodes are expected but node ' + cellnode.NodeName + ' was found.');

					self.Cell[x, y].Deserialize(cellnode);

					x := x + 1;
				end;
			end;

			y := y + 1;

		end;

	end;

	playernode := node.ChildNodes.FindNode('player');
	if (playernode=nil) then
		raise Exception.Create('Node "player" not found');
	self.Player.Deserialize(playernode);

end;

procedure TGameEngine.Serialize(node: IXMLNode);
	var rownode, cellnode, matrixnode, playernode : IXMLNode;
	var x, y, j : integer;
begin
	inherited;

	matrixnode := node.AddChild('matrix');
	matrixnode.Attributes['width'] := self.Fsize.cx;
	matrixnode.Attributes['height'] := self.Fsize.cy;

	j := 0;
	for y:=0 to self.Fsize.cy-1 do
	begin

		rownode := matrixnode.AddChild('row');

		for x:=0 to self.Fsize.cx-1 do
		begin
			cellnode := rownode.AddChild('c');

			self.CellByIndex[j].Serialize(cellnode);

			j := j+1;
		end;

	end;

	playernode := node.AddChild('player');
	self.Fplayer.Serialize(playernode);

end;

procedure TGameEngine.SetSize(width, height: integer);
	var i : integer;
begin

	for i:=(self.Fsize.cx*self.Fsize.cy-1) downto 0 do
		if (self.Fmatrix[i]<>nil) then
			self.Fmatrix[i].Free();

	SetLength(self.Fmatrix, width * height);

	self.Fsize.cx := width;
	self.Fsize.cy := height;

	for i:=width*height-1 downto 0 do
		self.Fmatrix[i] := TGameCell.Create(self);
end;

constructor TGameEngine.Create;
begin
	inherited;

	self.Fplayer := TSPlayer.Create(self);
	self.Fmatrix := nil;
	self.Fsize.cx := 0;
	self.Fsize.cy := 0;

	self.Clear;
end;

destructor TGameEngine.Destroy;
begin

	self.SetSize(0, 0);
	FreeAndNil(self.Fplayer);

	inherited;
end;

function TGameEngine.IsValidIndex(i : integer): boolean;
begin
	result := (i>=0) and (i < self.Fsize.cx*self.Fsize.cy);
end;

function TGameEngine.IsValidPosition(x, y: integer): boolean;
begin
	result := (x>=0) and (x<self.Fsize.cx) and
				(y>=0) and (y<self.Fsize.cy);
end;

function TGameEngine.PlayerWon: boolean;
	var i, m : integer;
	var cell : TGameCell;
begin

	result := true;

	m := self.CellCount-1;
	i := 0;
	while (i<m) and (result) do
	begin

		cell := self.CellByIndex[i];
		if (cell.ContainsBox) and (cell.kind <> sckGoal) then
			result := false;

		i := i + 1;
	end;

end;

{ TGameObject }

constructor TGameObject.Create(aowner: TGameEngine);
begin
	self.Fowner := aowner;
end;

end.

