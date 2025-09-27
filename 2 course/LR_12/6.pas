program zadanie6;
var
  inputFile, outputFile: TextFile;
  line: string;
begin
  AssignFile(inputFile, 'C:\Users\egork\Desktop\6.txt');
  AssignFile(outputFile, 'C:\Users\egork\Desktop\6.1.txt');
 
    reset(inputFile);
    rewrite(outputFile);
    
    while not EOF(inputFile) do
    begin
      ReadLn(inputFile, line);
      
      if Trim(line) <> '' then
        WriteLn(outputFile, line); 
    end;

 
    CloseFile(inputFile);
    CloseFile(outputFile);
  
  Writeln('Пустые строки удалены. Результат записан в 6.1.txt');
end.
