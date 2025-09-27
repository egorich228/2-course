program zadanie2;
function sumTo(n: integer): integer; //параметризация
begin
  if n = 1 then //база
    sumTo := 1  
  else
    sumTo := n + sumTo(n - 1);  //декомпозиция
end;
var
  n: integer;
begin
  write('Введите значение n: ');
  readLn(n);  
  if n < 1 then
    writeLn('Пожалуйста, введите положительное число.')
  else
    writeLn('Сумма от 1 до ', n, ' равна ', sumTo(n));
end.