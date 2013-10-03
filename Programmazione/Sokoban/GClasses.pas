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


unit GClasses;

interface

uses
  SysUtils, Variants, Classes, Graphics, Math, Contnrs, Types,
  xmldom, XMLIntf, msxmldom, XMLDoc, Dialogs;

type

	TSerializable = class
	private
	protected
	public

		// Serialization method
		procedure Serialize(node : IXMLNode); virtual;

		// Deserialization method
		procedure Deserialize(node : IXMLNode); virtual;

		// Clear method - called before deserialization
		procedure Clear; virtual;
	end;

function Serialize(obj : TSerializable) : IXMLDocument; overload;
procedure Serialize(obj : TSerializable; const filename : string); overload;
procedure Serialize(obj : TSerializable; stream : TStream); overload;

procedure Deserialize(obj : TSerializable; stream : TStream); overload;
procedure Deserialize(obj : TSerializable; const fname : string); overload;

implementation

{ TSerializable }

procedure TSerializable.Clear;
begin
end;

procedure TSerializable.Deserialize(node: IXMLNode);
begin
	self.Clear();
end;

procedure TSerializable.Serialize(node: IXMLNode);
begin
end;

{ Serialization and DeSerialization methods }

procedure Deserialize(obj : TSerializable; const fname : string); overload;
	var doc : IXMLDocument;
	var root : IXMLNode;
begin

	if (obj=nil) then
		raise Exception.Create('Cannot deserialize to a null object');

	doc := TXMLDocument.Create(nil);
	doc.LoadFromFile(fname);

	root := doc.ChildNodes.FindNode('root');

	if (root=nil) then
		raise Exception.Create('Cannot find "root" node in XML file');

	obj.Deserialize(root);

	// doc destructor must not be called becouse interfare reference counting
	// will release object when needed.

end;

procedure Deserialize(obj : TSerializable; stream : TStream); overload;
	var doc : IXMLDocument;
	var root : IXMLNode;
begin

	if (obj=nil) then
		raise Exception.Create('Cannot deserialize to a null object');

	doc := TXMLDocument.Create(nil);

	doc.LoadFromStream(stream);
	doc.Active := true;

	root := doc.ChildNodes.FindNode('root');

	if (root=nil) then
		raise Exception.Create('Cannot find "root" node in XML file');

	obj.Deserialize(root);

	// doc destructor must not be called becouse interfare reference counting
	// will release object when needed.
end;

function Serialize(obj: TSerializable): IXMLDocument; overload;
	var doc : TXMLDocument;
	var root : IXMLNode;
begin

	if (obj=nil) then
		raise Exception.Create('Cannot serialize a null object');

	doc := TXMLDocument.Create(nil);
	doc.Active := true;
	root := doc.AddChild('root', '');
	doc.NodeIndentStr := '    ';
	doc.Version := '1.0';
	doc.Options := [doNodeAutoIndent];

	obj.Serialize(root);

	result := doc;

	// doc destructor must not be called becouse interfare reference counting
	// will release object when needed.
	
end;

procedure Serialize(obj : TSerializable; const filename: string); overload;
begin
	Serialize(obj).SaveToFile(filename);
end;

procedure Serialize(obj : TSerializable; stream : TStream); overload;
begin
	Serialize(obj).SaveToStream(stream);
end;

end.

