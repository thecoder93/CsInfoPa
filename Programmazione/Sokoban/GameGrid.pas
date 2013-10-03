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


unit GameGrid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Math, Grids,
  GameEngine, GameBoardStyle, GameBoard, GClasses, GameItemStyle, GameCellStyle;

type

	TGameGrid = class;

	TOnPlayerMovedEvent = procedure
	(
		Sender : TGameGrid;
		direction : TDirection;
		boxmoved : boolean
	) of object;

	TGameGrid = class(TDrawGrid)
	private

		FCentered : boolean;
		FGameBoard : TGameBoard;
		FOwnsGameBoard : boolean;
		FZoom: integer;

		FOnAutoCenter : TNotifyEvent;
		FOnPlayerMoved : TOnPlayerMovedEvent;
		FOnPlayerWin : TNotifyEvent;

		procedure set_Zoom(Value: integer);
    procedure set_Centered(const Value: boolean);

	protected

		procedure SetParent(AParent: TWinControl); override;

		procedure DrawCell
		(
			ACol, ARow: Longint;
			ARect: TRect;
			AState: TGridDrawState
		); override;

		procedure KeyDown(var Key: Word; Shift: TShiftState); override;
		procedure PlayerWin(); virtual;

	public

		procedure DoAutoCenter(); virtual;

		constructor Create(aowner : TComponent); override;
		destructor Destroy; override;

		property OwnsGameBoard : boolean read FOwnsGameBoard;
		property GameBoard : TGameBoard read FGameBoard;

		procedure SetGameBoard
		(
			agameboard : TGameBoard;
			ownsobject : boolean = false
		); virtual;

		procedure RefreshFromBoard(); virtual;
		procedure UpdateCellSize(); virtual;
		procedure DoMove(direction : TDirection); virtual;

		procedure InvalidateCell(ACol, ARow: Longint); reintroduce;

	published

		property Centered : boolean
			read FCentered write set_Centered;
	
		property Zoom : integer
			read FZoom write set_Zoom default 1;

		property OnPlayerMoved : TOnPlayerMovedEvent
			read FOnPlayerMoved write FOnPlayerMoved;
			
		property OnAutoCenter : TNotifyEvent
			read FOnAutoCenter write FOnAutoCenter;

		property OnPlayerWin : TNotifyEvent
			read FOnPlayerWin write FOnPlayerWin;
	end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Samples', [TGameGrid]);
end;

{ TGameGrid }

constructor TGameGrid.Create(aowner: TComponent);
begin
	inherited Create(aowner);

	self.FZoom := 1;

	{ Set default properties }

	self.FixedCols := 0;
	self.FixedRows := 0;
	self.DefaultColWidth := 24;
	self.DefaultRowHeight := 24;
	self.DefaultDrawing := false;
	self.ParentCtl3D := false;
	self.Ctl3D := false;
	self.GridLineWidth := 1;
	self.ScrollBars := ssNone;
	self.BorderStyle := bsNone;
	self.Align := alNone;

	self.FCentered := false;

	self.DoAutoCenter;
end;

procedure TGameGrid.DrawCell(ACol, ARow: Integer; ARect: TRect;
  AState: TGridDrawState);

  var cellstyle : TGameCellStyle;
  var cell : TGameCell;
  var mustdrawbox, mustdrawplayer, mustdrawcell : boolean;
  var pic : TPicture;
  var r1 : TRect;
  
begin
	if (self.FGameBoard = nil) or (not self.FGameBoard.Ready) then
	begin
		self.Canvas.Brush.Color := self.Color;
		self.Canvas.FillRect(arect);
	end else begin

		cell := self.FGameBoard.Engine.Cell[acol, arow];
		cellstyle := self.FGameBoard.Style.CellStyle[cell.kind];

		mustdrawplayer := self.FGameBoard.Engine.Player.IsIn(ACol, ARow);
		mustdrawbox := cell.ContainsBox;
		mustdrawcell := true;

		if (cellstyle.Picture<>nil) then
		begin

			if (mustdrawbox) and
				(cellstyle.BoxInCellPicture.Picture<>nil) then
			begin

				mustdrawcell := false;
				mustdrawbox := false;

				self.Canvas.StretchDraw
				(
					arect,
					cellstyle.BoxInCellPicture.Picture.Graphic
				);
			end;

			if (mustdrawplayer) and 
				(cellstyle.PlayerInCellPicture.Picture<>nil) then
			begin

				mustdrawplayer := false;
				mustdrawcell := false;

				self.Canvas.StretchDraw
				(
					arect,
					cellstyle.PlayerInCellPicture.Picture.Graphic
				);

			end;

			if (mustdrawcell) then
			begin

				mustdrawcell := false;

				self.Canvas.StretchDraw
				(
					arect,
					cellstyle.Picture.Graphic
				);

			end;

		end;

		if (mustdrawcell) then
		begin
			self.Canvas.Brush.Color := cellstyle.Color;
			self.Canvas.FillRect(arect);
		end;

		if (mustdrawbox) then
		begin

			pic := self.FGameBoard.Style.BoxStyle.Picture;

			if (pic=nil) then
			begin

				self.Canvas.Brush.Color := self.FGameBoard.Style.BoxStyle.Color;

				{ smaller rectangle }

				r1.Left := arect.Left + self.DefaultColWidth div 6;
				r1.Top := arect.Top + self.DefaultRowHeight div 6;
				r1.Right := arect.Right - self.DefaultColWidth div 6;
				r1.Bottom := arect.Bottom - self.DefaultRowHeight div 6;

				self.Canvas.FillRect(r1);

			end else begin

				self.Canvas.StretchDraw(arect, pic.Graphic)

			end;
		
		end;

		if (mustdrawplayer) then
		begin

			pic := self.FGameBoard.Style.PlayerStyle.Picture;
	
			if (pic=nil) then
			begin

				self.Canvas.Brush.Color := self.FGameBoard.Style.PlayerStyle.Color;
				self.Canvas.Ellipse(arect);

			end else begin

				self.Canvas.StretchDraw(arect, pic.Graphic)

			end;

		end;
		
	end;
end;

procedure TGameGrid.DoAutoCenter;
	var w, h : integer;
begin
	if (self.Parent<>nil) then
	begin

		w := (self.DefaultColWidth + self.GridLineWidth) * self.ColCount;
		h := (self.DefaultRowHeight + self.GridLineWidth) * self.RowCount;

		if (self.Centered) then
		begin
			self.SetBounds
			(
				(Parent.ClientWidth - w) div 2,
				(Parent.ClientHeight - h) div 2,
				w,
				h
			);
		end else begin

			self.Width := w;
			self.Height := h;

		end;

	end;

	if (Assigned(FOnAutoCenter)) then
		FOnAutoCenter(self);
end;

procedure TGameGrid.SetParent(AParent: TWinControl);
begin
	inherited;
	self.DoAutoCenter();
end;

procedure TGameGrid.SetGameBoard(agameboard: TGameBoard; ownsobject: boolean);
begin
	if (self.FOwnsGameBoard) then
		FreeAndNil(FGameBoard);

	self.FGameBoard := agameboard;
	self.FOwnsGameBoard := (self.FGameBoard<>nil) and ownsobject;

	self.RefreshFromBoard();
end;

destructor TGameGrid.Destroy;
begin
	SetGameBoard(nil, false);
	inherited;
end;

procedure TGameGrid.UpdateCellSize();
begin
	if (self.FGameBoard <> nil) then
	begin
		self.DefaultColWidth := self.FGameBoard.Style.CellSizeInPixel * self.Zoom;
		self.DefaultRowHeight := self.FGameBoard.Style.CellSizeInPixel * self.Zoom;
	end else begin
		self.DefaultColWidth := 20 * self.Zoom;
		self.DefaultRowHeight := 20 * self.Zoom;
	end;
end;

procedure TGameGrid.RefreshFromBoard;
begin

	if (self.FGameBoard = nil) then
	begin
		self.ColCount := 10;
		self.RowCount := 10;
	end else
	begin
		self.ColCount := self.FGameBoard.Engine.Width;
		self.RowCount := self.FGameBoard.Engine.Height;

		if (self.FGameBoard.Style.ShowGridLines) then
			self.GridLineWidth := 1
		else
			self.GridLineWidth := 0;

		UpdateCellSize();

		self.DoubleBuffered := self.FGameBoard.Style.DoubleBuffered;
	end;

	self.DoAutoCenter;
	self.Invalidate;

end;

procedure TGameGrid.PlayerWin();
begin
	if (Assigned(self.FOnPlayerWin)) then
		self.FOnPlayerWin(self);
end;

procedure TGameGrid.DoMove(direction : TDirection);
	var objectsmoved : integer;
	var p : TPoint;
	var i : integer;
begin
	if (direction<>dirNone) and (self.Enabled) then
	begin

		p := self.FGameBoard.Engine.Player.Position;

		objectsmoved := self.FGameBoard.Engine.Player.Move(direction);

		if (objectsmoved>0) then
		begin

			self.InvalidateCell(p.X, p.Y);
			for i:=0 to objectsmoved do
			begin
				p := CalcMove(p, direction);
				self.InvalidateCell(p.X, p.Y);
			end;

			if (Assigned(self.FOnPlayerMoved)) then
			begin
				self.FOnPlayerMoved(self, direction, objectsmoved>1);
			end;
			
			if (self.FGameBoard.Engine.PlayerWon()) then
			begin
				PlayerWin();
			end;

		end;

	end;
end;

procedure TGameGrid.KeyDown(var Key: Word; Shift: TShiftState);
begin

	inherited;

	if (self.FGameBoard<>nil) and (self.FGameBoard.Ready) then
	begin

		case Key of
			vk_Left  : DoMove(dirLeft);
			vk_Right : DoMove(dirRight);
			vk_Up    : DoMove(dirUp);
			vk_Down  : DoMove(dirDown);
		end;

	end;
end;

procedure TGameGrid.set_Zoom(Value : integer);
begin
	if (Value<1) then
		Value := 1;

	if (FZoom <> Value) then
	begin
		FZoom := Value;
		RefreshFromBoard();
	end;
end;

procedure TGameGrid.InvalidateCell(ACol, ARow: Integer);
begin
	inherited InvalidateCell(ACol, ARow);
end;

procedure TGameGrid.set_Centered(const Value: boolean);
begin
	if (FCentered<>Value) then
	begin
		FCentered := Value;

		if (Value) then
		begin
			self.Anchors := [];
			self.DoAutoCenter();
		end else begin
			self.Anchors := [akLeft, akTop];
		end;
	end;
end;

end.

