function HOD(a, b: integer): integer; //параметризация
begin
  if b = 0 then // база
    HOD := a
  else
    HOD := HOD(b, a mod b); //декомпозиция
end;
var
  num1, num2: integer;
begin
  write('Введите первое число: ');
  readLn(num1);
  write('Введите второе число: ');
  readLn(num2);
  writeLn('Наибольший общий делитель: ', HOD(num1, num2));
end.