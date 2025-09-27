program dkr;

var x: real;
begin
  writeln('Введите значение x: ');
  readln(x);
  
  if (x < -9)  then
  begin
    if x > 0 then
      writeln(ln(x):0:2)
    else writeln('Отрицательного логарифма не существует!');
  end
 
  else if (-9 <= x) and (x < -3) then
    writeln('10')
  
  else if (-3 <= x) then 
  begin
    if x > 0 then
      writeln(log10(x) * Power(x, 3) - 25:0:2)
    else writeln('Отрицательного логарифма не существует!')
  end;
end.
