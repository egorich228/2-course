var
  s:string;
  max,c,i:integer;
  ls: array of string;
  f1,f2: text;
begin
  assign(f1,'C:\Users\egork\Desktop\2.1.txt');
  assign(f2,'C:\Users\egork\Desktop\2.2.txt');
  reset(f1);
  readln(f1,s);
  max:=length(s);
  c:=0;
  while not eof(f1) do
  begin
    readln(f1,s);
    if max < (length(s)) then
      max:=length(s)
  end;
  reset(f1);
  while not eof(f1) do
  begin
    readLn(f1, s);
    if length(s) = max then
    begin
      setlength(ls, c + 1);
      ls[c] := s;
      inc(c);
    end;
  end;
  rewrite(f2);
  for i := c - 1 downto 0 do
  begin
    WriteLn(f2, ls[i]);
  end;
  close(f1);
  close(f2);
end.