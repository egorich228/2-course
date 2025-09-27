procedure fib(i, n: integer); //параметризация
begin
  if i <= 21 then  //база
  begin
    write(i, ' ');  
    fib(n, i + n);  //декомпозиция
  end;
end;
begin
  fib(1, 2);  
end.
