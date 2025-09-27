type
    WordRecord = record
        Word: string;
        Frequency: integer;
    end;
var
    Words: array of WordRecord;  
    WordCount: integer;          
    InputWord: string;
    Found: boolean;
    i: integer;
procedure AddWord(const NewWord: string);
begin
    Found := false;
    // Проверяем, есть ли слово уже в массиве
    for var i := 0 to WordCount - 1 do
    begin
        if Words[i].Word = NewWord then
        begin
            Words[i].Frequency := Words[i].Frequency + 1; 
            Found := True;
            Break;
        end;
    end;
    if not Found then
    begin
        SetLength(Words, WordCount + 1);
        Words[WordCount].Word := NewWord;
        Words[WordCount].Frequency := 1;
        inc(WordCount);
    end;
end;
begin
    WordCount := 0;
    writeLn('Введите текст (для завершения введите "exit"):');
    repeat
        readLn(InputWord);
        if InputWord <> 'exit' then
            AddWord(LowerCase(InputWord)); 
    until InputWord = 'exit';
    writeLn('Количество различных слов: ', WordCount);
    writeLn('Алфавитно-частотный словарь:');
    for i := 0 to WordCount - 1 do
    begin
        writeLn(Words[i].Word, ': ', Words[i].Frequency);
    end;
end.
