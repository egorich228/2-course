program zadanie2;

function kolichestvo(mainString, subString: string): integer;
var
  count, i, j: integer;
  mainLength, subLength: integer;
  found: boolean;
begin
  count := 0;
  mainLength := Length(mainString);
  subLength := Length(subString);

  for i := 1 to mainLength - subLength + 1 do
  begin
    found := true;

    for j := 1 to subLength do
    begin
      if mainString[i + j - 1] <> subString[j] then
      begin
        found := false; 
        Break;
      end;
    end;

    if found then
      count += 1;
  end;
  kolichestvo := count; 
end;

var
  mainString, subString: string;
  result: integer;

begin
  write('Введите основную строку: ');
  readLn(mainString);
  write('Введите подстроку для поиска: ');
  readLn(subString);

  result := kolichestvo(mainString, subString);
  
  writeLn('Количество вхождений "', subString, '" в "', mainString, '": ', result);
end.
