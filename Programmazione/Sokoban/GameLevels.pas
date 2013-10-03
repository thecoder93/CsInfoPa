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


unit GameLevels;

interface

uses
  SysUtils, Variants, Classes, Graphics, Math, Contnrs, Types, GClasses,
  xmldom, XMLIntf, msxmldom, XMLDoc;

type

	TGameLevel = class(TSerializable)
	private
		Ffilename : string;
		Fdescription : string;

		procedure set_Description(const Value: string);
    	procedure set_FileName(const Value: string);

	protected
	public

		property FileName : string
			read FFileName write set_FileName;
		
		property Description : string
			read FDescription write set_Description;

		procedure Clear; override;
		procedure Serialize(node : IXMLNode); override;
		procedure Deserialize(node : IXMLNode); override;

		constructor Create(const afilename, adescription : string); overload;
		constructor Create(node : IXMLNode); overload;
		
	end;

	TGameLevels = class(TSerializable)
	private
		Flevels : TObjectList;
		function get_Count: integer;
		function get_Item(index: integer) : TGameLevel;

	protected
	public

		function Add(const filename, description : string) : TGameLevel;

		procedure Clear; override;
		procedure Serialize(node : IXMLNode); override;
		procedure Deserialize(node : IXMLNode); override;

		property Count : integer read get_Count;
		property Item[index : integer] : TGameLevel read get_Item; default;

		constructor Create;
		destructor Destroy; override;
	end;
  
implementation

{ TGameLevel }

procedure TGameLevel.Clear;
begin
	self.Ffilename := '';
	self.Fdescription := '';
end;

constructor TGameLevel.Create(const afilename, adescription: string);
begin
	inherited Create();

	self.FileName := afilename;
	self.Description := adescription;
end;

constructor TGameLevel.Create(node: IXMLNode);
begin
	inherited Create();

	self.Deserialize(node);
end;

procedure TGameLevel.Deserialize(node: IXMLNode);
	var cnode : IXMLNode;
begin
	inherited;

	cnode := node.ChildNodes.FindNode('filename');
	if (cnode=nil) then
		raise Exception.Create('Node "filename" not found');
	self.FileName := cnode.NodeValue;

	cnode := node.ChildNodes.FindNode('description');
	if (cnode=nil) then
		raise Exception.Create('Node "description" not found');
	self.Description := cnode.NodeValue;
end;

procedure TGameLevel.Serialize(node: IXMLNode);
begin
	inherited;

	node.AddChild('filename').NodeValue := self.FileName;
	node.AddChild('description').NodeValue := self.Description;
end;

procedure TGameLevel.set_Description(const Value: string);
	var s : string;
begin
	if (self.Fdescription <> Value) then
	begin
		s := trim(Value);

		if (length(s)<=0) then
			raise Exception.Create('Empty string is an invalid description');

		if (pos(s, '=')>0) then
			raise Exception.Create('Character "=" is not allowed');

		self.Fdescription := s;
	end;
end;

procedure TGameLevel.set_FileName(const Value: string);
	var s : string;
begin
	if (self.Ffilename <> Value) then
	begin
		s := UpperCase(trim(Value));

		if (length(s)<=0) then
			raise Exception.Create('Empty string is an invalid filename');

		if (pos(s, '=')>0) then
			raise Exception.Create('Character "=" is not allowed');

		self.Ffilename := s;
	end;
end;

{ TGameLevels }

function TGameLevels.Add(const filename, description: string) : TGameLevel;
begin
	result := TGameLevel.Create(filename, description);
	self.Flevels.Add(result);
end;

procedure TGameLevels.Clear;
begin
	inherited;

	self.Flevels.Clear();
end;

constructor TGameLevels.Create;
begin
	self.Flevels := TObjectList.Create(true);
end;

procedure TGameLevels.Deserialize(node: IXMLNode);
	var i : integer;
	var cnode : IXMLNode;
	var level : TGameLevel;
begin
	inherited;

	for i:=0 to node.ChildNodes.Count-1 do
	begin
		cnode := node.ChildNodes.Get(i);
		if (cnode.NodeType <> ntComment) then
		begin
			if (cnode.NodeName <> 'level') then
				raise Exception.Create('Node "level" expected but node "' + cnode.NodeName + '" found.');

			level := TGameLevel.Create(cnode);
			self.Flevels.Add(level);
		end;
	end;
end;

destructor TGameLevels.Destroy;
begin

	FreeAndNil(self.Flevels);

	inherited;
end;

function TGameLevels.get_Count: integer;
begin
	result := self.Flevels.Count;
end;

function TGameLevels.get_Item(index: integer): TGameLevel;
begin
	result := self.Flevels[index] as TGameLevel;
end;

procedure TGameLevels.Serialize(node: IXMLNode);
	var i : integer;
begin
	inherited;

	for i:=0 to self.Count-1 do
		self[i].Serialize(node.AddChild('level'));

end;

end.

