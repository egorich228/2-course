program zadanie2;

var
  filetext: text;
  N, K, i: integer;
  stars: string;

begin
  writeln('Введите количество строк (N):');
  readln(N);
  writeln('Введите количество звездочек в строке (K):');
  readln(K);

  
  stars := StringOfChar('*', K);

 
  assign(filetext, 'C:\Users\egork\Desktop\2.txt'); 
  rewrite(filetext);

  for i := 1 to N do
  begin
    writeln(filetext, stars);
  end;
 
  close(filetext);

  writeln('Файл успешно создан и заполнен!');
end.
