procedure LoopFor(i, n: integer); // параметризация
{ Первый параметр – счетчик шагов, второй параметр – общее количество шагов }
begin
  if i <= n then // база рекурсии
  begin
    writeln('привет ', i);
    LoopFor(i + 1, n); //декомпозиция
  end;
end;
begin
  LoopFor(1, 10);  
end.
