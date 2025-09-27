program zadanie5;
var
  Inp, Out: TextFile;
  n, min, max: integer;
begin
  assignfile(Inp, 'C:\Users\egork\Desktop\input.txt');
  reset(Inp);
  readln(Inp, n);
  min := n;
  max := n;
  while not eof(Inp) do
  begin
    readln(Inp, n);
    if n < min then
      min := n;
    if n > max then
      max := n;
  end;
  closefile(Inp);
  assignfile(Out, 'C:\Users\egork\Desktop\output.txt');
  rewrite(Out);
  writeln(Out, 'Максимальное число: ', max);
  writeln(Out, 'Минимальное число: ', min);
  closefile(Out);
end.