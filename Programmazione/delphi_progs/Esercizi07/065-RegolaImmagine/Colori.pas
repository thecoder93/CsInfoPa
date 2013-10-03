unit Colori;

interface

uses
	Windows, Messages, SysUtils, Classes, Graphics, Dialogs, Math, Controls, Forms;

type

// puntatore ad array di triplette di byte da usare con ScanLine
  PRGBArray = ^TRGBArray;
  TRGBArray = array [0..maxint div 4] of TRGBTriple;

// spiegazione RGB
// Red -> rosso
// Green -> verde
// Blue -> blu

// spiegazione HSL
// Hue -> tonalità
// Saturation -> saturazione (0 = grigi, 1 = colori pieni)
// Luminance -> luminosità (non esattamente ma quasi)

// ha una tripletta di byte RGB in input e fornisce
// H, S e L come valori tra 0 e 1 in output.
procedure RGBtoHSL(const rgb : TRGBTriple; out H, S, L : double);

// ha in input H, S e L come valori tra 0 e 1 e fornisce
// una tripletta di byte RGB in output.
procedure HSLtoRGB(const H, S, L : double; out rgb : TRGBTriple);

implementation

procedure RGBtoHSL(const rgb : TRGBTriple; out H, S, L : double);
var
	delta, r, g, b, cmax, cmin: double;
begin
	r := rgb.rgbtRed / 255;
	g := rgb.rgbtGreen / 255;
	b := rgb.rgbtBlue / 255;
	if (r > b) and (r > g) then
		cmax := r
	else if g > b then
		cmax := g
	else
		cmax := b;
	if (r < b) and (r < g) then
		cmin := r
	else if g < b then
		cmin := g
	else
		cmin := b;
	L := (cmax+cmin) / 2.0;

	if cmax=cmin then begin
		S := 0;
		H := 0; // sarebbe indefinita
	end	else begin
		delta := cmax - cmin;
		if L <= 0.5 then
			s := delta / (cmax + cmin)
		else
			s := delta / (2.0 - cmax - cmin);
		if r = cmax then
			H := (g - b) / delta
		else if g = cmax then
			H := 2.0 + (b - r) / delta
		else
			H := 4.0 + (r - g) / delta;
		H := H / 6.0;
		if H < 0 then
			H := H + 1;
	end;
end;

procedure HSLtoRGB(const H, S, L : double; out rgb : TRGBTriple);
var
	r, g, b, m1, m2 : double;

	function HuetoRGB(m1,m2, h: double): double;
  begin
		if h < 0 then
			h := h + 1.0
		else if h > 1 then
			h := h - 1.0;
		if 6.0*h < 1 then
			result := (m1+(m2-m1)*h*6.0)
		else if 2.0*h < 1 then
			result := m2
		else if 3.0*h < 2.0 then
			result := (m1+(m2-m1)*((2.0/3.0)-h)*6.0)
		else
			result := m1;
	end;

begin
	if S = 0 then begin
		r := L;
		g := L;
		b := L;
	end	else begin
		if L <= 0.5 then
			m2 := L*(1.0+S)
		else
			m2 := L+S-L*S;
		m1 := 2.0*L-m2;
		r := HuetoRGB(m1,m2,H+1.0/3.0);
		g := HuetoRGB(m1,m2,H);
		b := HuetoRGB(m1,m2,H-1.0/3.0);
	end;
	rgb.rgbtBlue := round(b * 255);
	rgb.rgbtGreen := round(g * 255);
	rgb.rgbtRed := round(r * 255);
end;

end.

