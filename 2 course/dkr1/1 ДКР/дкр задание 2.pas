var x:real;
begin
  x:=-11;
  while x <= -1 do
  begin
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
    else writeln('Отрицательного логарифма не существует!');
    
  end;
  x := x + 0.1;
  end;
end.