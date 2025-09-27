function zadanie6(const s: string): boolean;
var
  i: integer;
begin
  if Length(s) = 0 then
    Exit;
  if not (s[1] in ['a'..'z', 'A'..'Z', '_']) then
    Exit;
  for i := 2 to Length(s) do
  begin
    if not (s[i] in ['a'..'z', 'A'..'Z', '0'..'9', '_']) then
      Exit;
  end;
  result := true;
end;
var
  input: string;
begin
  write('Введите строку: ');
  readLn(input);
  if zadanie6(input) then
    writeLn('Строка допустима.')
  else
    writeLn('Строка содержит недопустимые символы.');
end.

