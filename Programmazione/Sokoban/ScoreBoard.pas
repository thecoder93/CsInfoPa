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


unit ScoreBoard;

interface

uses
  SysUtils, Variants, Classes, Graphics, Math, Contnrs, Types, GClasses,
  xmldom, XMLIntf, msxmldom, XMLDoc, StrUtils;

const ScoreBoard_MaxItemCount = 15;
const ScoreBoardItem_MaxPlayerNameLength = 30;

type

	TScoreBoardItem = class(TSerializable)
	private

		FDate: TDateTime;
		FBoxMoves: integer;
		FGameTime: integer;
		FPlayerMoves: integer;
		FScores: real;
		Fplayername: string;

		procedure set_PlayerName(Value: string);

	protected
	public

		property PlayerName : string
			read Fplayername write set_PlayerName;

		property Date : TDateTime
			read FDate;

		property BoxMoves : integer
			read FBoxMoves write FBoxMoves;

		property PlayerMoves : integer
			read FPlayerMoves write FPlayerMoves;

		property GameTime : integer
			read FGameTime write FGameTime;

		property Scores : real
			read FScores write FScores;

		function CompareTo(b : TScoreBoardItem) : integer;

		procedure Clear(); override;
		
		procedure Serialize(node : IXMLNode); override;
		procedure Deserialize(node : IXMLNode); override;

		constructor Create(node : IXMLNode); overload;
		constructor Create(const aplayername : string; ascores : real); overload;
		
	end;

	TScoreBoard = class(TSerializable)
	private

		Fitems : TObjectList;

		function get_Item(index: integer) : TScoreBoardItem;
    	function get_Count : integer;

	protected
	public

		property Item[index : integer] : TScoreBoardItem
			read get_Item; default;
	
		property Count : integer
			read get_Count;

		// Returns the index of the object or -1 if object wasn't added.
		// You have to free the object manually if this function returns -1.
		// This class will destroy it's items when instance is destroyed.
		// If an item is added you cannot destroy it!
		// This function can trow exceptions, in this case, the caller
		// must destroy the item if an exception is raised.
		function Add(item : TScoreBoardItem) : integer;

		procedure Clear(); override;
		procedure Serialize(node : IXMLNode); override;
		procedure Deserialize(node : IXMLNode); override;

		constructor Create;
		destructor Destroy; override;
	end;

function ValidatePlayerName(const playername : string) : string;

implementation

function ValidatePlayerName(const playername : string) : string;
begin
	result := trim(LeftStr(playername, ScoreBoardItem_MaxPlayerNameLength));
end;

{ TScoreBoardItem }

procedure TScoreBoardItem.Clear;
begin
	inherited;

	self.Fplayername := '';
	self.FDate := now();

	self.BoxMoves := 0;
	self.GameTime := 0;
	self.PlayerMoves := 0;
	self.Scores := 0;
end;

function TScoreBoardItem.CompareTo(b: TScoreBoardItem): integer;
begin
	if (self = b) then
		result := 0
	else if (b=nil) then
		result := 1
	else begin
		if (self.Scores > b.Scores) then
			result := 1
		else if (self.Scores < b.Scores) then
			result := -1
		else begin
			result := self.GameTime - b.GameTime;

			if (result = 0) then
			begin

				if (self.Date > b.Date) then
					result := 1
				else if (self.Date < b.Date) then
					result := -1

			end;
		end;
	end;
end;

constructor TScoreBoardItem.Create(node: IXMLNode);
begin
	inherited Create();

	self.Deserialize(node);
end;

constructor TScoreBoardItem.Create(const aplayername: string; ascores: real);
begin
	inherited Create();

	Clear();

	self.PlayerName := aplayername;
	self.Scores := ascores;
end;

procedure TScoreBoardItem.Deserialize(node: IXMLNode);
	var cnode : IXMLNode;
begin
	inherited;

	if (not node.HasAttribute('name')) then
		raise Exception.Create('Attribute "name" not found');
	self.PlayerName := node.Attributes['name'];

	cnode := node.ChildNodes.FindNode('Date');
	if (cnode=nil) then
		raise Exception.Create('Node "Date" not found');
	self.FDate := StrToDateTime(cnode.NodeValue);

	cnode := node.ChildNodes.FindNode('BoxMoves');
	if (cnode=nil) then
		raise Exception.Create('Node "BoxMoves" not found');
	self.BoxMoves := cnode.NodeValue;
	
	cnode := node.ChildNodes.FindNode('PlayerMoves');
	if (cnode=nil) then
		raise Exception.Create('Node "PlayerMoves" not found');
	self.PlayerMoves := cnode.NodeValue;

	cnode := node.ChildNodes.FindNode('GameTime');
	if (cnode=nil) then
		raise Exception.Create('Node "GameTime" not found');
	self.GameTime := cnode.NodeValue;

	cnode := node.ChildNodes.FindNode('Scores');
	if (cnode=nil) then
		raise Exception.Create('Node "Scores" not found');
	self.Scores := cnode.NodeValue;

end;

procedure TScoreBoardItem.Serialize(node: IXMLNode);
begin
	inherited;

	node.Attributes['name'] := self.PlayerName;
	node.AddChild('Date').NodeValue := DateTimeToStr(self.Date);
	node.AddChild('BoxMoves').NodeValue := self.BoxMoves;
	node.AddChild('PlayerMoves').NodeValue := self.PlayerMoves;
	node.AddChild('GameTime').NodeValue := self.GameTime;
	node.AddChild('Scores').NodeValue := self.Scores;
	
end;

procedure TScoreBoardItem.set_PlayerName(Value: string);
begin
	Value := ValidatePlayerName(Value);

	if (length(Value) <= 0) then
		raise Exception.Create('Invalid player name');

	self.Fplayername := Value;
end;

{ TScoreBoard }

procedure TScoreBoard.Clear;
begin
	inherited;

	self.Fitems.Clear();
end;

function TScoreBoard.get_Item(index: integer): TScoreBoardItem;
begin
	result := self.Fitems[index] as TScoreBoardItem;
end;

procedure TScoreBoard.Deserialize(node: IXMLNode);
	var i : integer;
	var cnode : IXMLNode;
	var tmp : TScoreBoardItem;
begin
	inherited;

	for i:=0 to node.ChildNodes.Count-1 do
	begin
		cnode := node.ChildNodes[i];
		if (cnode.NodeType <> ntComment) then
		begin
			if (cnode.NodeName <> 'player') then
				raise Exception.Create('Node "player" expected but node "' + cnode.NodeName + '" found');

			tmp := TScoreBoardItem.Create(cnode);

			try
				self.Add(tmp);
			except
				FreeAndNil(tmp);
			end;

		end;
	end;
	
end;

procedure TScoreBoard.Serialize(node: IXMLNode);
	var i : integer;
begin
	inherited;

	for i:=0 to self.Count-1 do
	begin
		self[i].Serialize(node.AddChild('player'));
	end;
end;

function TScoreBoard.Add(item: TScoreBoardItem): integer;
	var i : integer;
begin
	if (item=nil) then
		raise Exception.Create('Cannot add a nil object');

	i := 0;
	while (i<self.Count) and (item.CompareTo(self[i]) >= 0) do
	begin

		if (self[i] = item) then
			raise Exception.Create('Cannot add same object twice');

		i := i + 1;
	end;

	if (i>=ScoreBoard_MaxItemCount) then
		result := -1
	else begin

		self.Fitems.Insert(i, item);
		result := i;

		if (self.Fitems.Count > ScoreBoard_MaxItemCount) then
			self.Fitems.Delete(self.Fitems.Count - 1);
	end;
end;

function TScoreBoard.get_Count: integer;
begin
	result := self.Fitems.Count;
end;

constructor TScoreBoard.Create;
begin
	inherited Create();

	self.Fitems := TObjectList.Create(true);
end;

destructor TScoreBoard.Destroy;
begin
	FreeAndNil(self.Fitems);
	inherited;
end;

end.

