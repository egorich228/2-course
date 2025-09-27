program zadanie1;
procedure print(n: integer); //параметризация
begin
  if n >= 0 then //база 
  begin 
    print(n - 2); 
    write(n, ' ');//декомпозиция
  end;
end;
begin
  print(25); 
end.