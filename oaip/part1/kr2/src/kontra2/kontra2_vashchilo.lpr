program kontra2_vashchilo;


uses
    sysutils, strutils, Math;


function factorial(n : Byte) : Extended;
var
    i : byte;
begin
     result := 1;
     for i := 1 to n do begin
          result := result * i;
     end;
end;

function ch(x : extended; eps : extended = 1e-4) : extended;
var
  i : Integer = 0;
  r : Extended;
begin
   Result := 0;
   while (True) do
   begin
        r := (Power(x, 2*i)) / Factorial(2*i);
        Result := Result + r;
        inc(i);
        if (abs(r) < abs(eps)) then break;
   end;
end;

var
  a, b, h: extended;
  eps : extended;
  x, r : extended;
begin
  write('Enter initial value A: ');
  readln(a);
  write('Enter final value B: ');
  readln(b);
  write('Enter step H: ');
  readln(h);
  write('Enter eps: ');
  readln(eps);

  x  := a;
  writeln('|___x___|___Math.Cosh()___|___cosh___|');
  while (x <= b) do
  begin
      r := ch(x, eps);
      writeln('| ',x:5:3, ' |     ', cosh(x):5:3, '       |   ', r:5:3, '  |');
      x := x + h;
  end;

  write('Press Enter to exit');
  readln;
end.

