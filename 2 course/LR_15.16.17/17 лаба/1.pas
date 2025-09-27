type
  TNode = record
    Value: Integer; // Значение узла
    Next: ^TNode;   // Указатель на следующий узел
    Prev: ^TNode;   // Указатель на предыдущий узел
  end;
  TDeque = record
    Front: ^TNode; // Указатель на передний узел дека
    Back: ^TNode;  // Указатель на задний узел дека
  end;
var
  InputFile, OutputFile: TextFile; 
  Number: integer; 
  Count, I: integer;
  Deque: TDeque; // Дек 
//инициализация дека
procedure InitDeque(var D: TDeque);
begin
  D.Front := nil; //передний узел как nil
  D.Back := nil; // задний узел как nil
end;
// Процедура добавления элемента в конец дека
procedure PushBack(var D: TDeque; Value: integer);
var
  NewNode: ^TNode; // Указатель на новый узел
begin
  New(NewNode); // Выделение памяти для нового узла
  NewNode^.Value := Value; // Присваивание значения новому узлу
  NewNode^.Next := nil; // Новый узел будет последним, поэтому Next = nil
  NewNode^.Prev := D.Back; // Указатель на предыдущий узел
  if D.Back <> nil then // Если дек не пустой
    D.Back^.Next := NewNode; // Обновляем указатель Next у последнего узла
  D.Back := NewNode; // Обновляем указатель на последний узел
  if D.Front = nil then // Если дек был пустым
    D.Front := NewNode; // Обновляем указатель на первый узел
end;
// Процедура извлечения элемента из конца дека
procedure PopBack(var D: TDeque; var Value: integer);
var
  Temp: ^TNode; // Временный указатель для хранения удаляемого узла
begin
  if D.Back <> nil then // Проверка, не пуст ли дек
  begin
    Temp := D.Back; // Сохраняем указатель на последний узел
    Value := Temp^.Value; // Получаем значение удаляемого узла
    D.Back := D.Back^.Prev; // Обновляем указатель на последний узел
    if D.Back <> nil then // Если дек не стал пустым после удаления
      D.Back^.Next := nil // Обнуляем указатель Next у нового последнего узла
    else
      D.Front := nil; // Если дек пустой, обнуляем указатель на первый узел
    Dispose(Temp); // Освобождаем память, занятую удаляемым узлом
  end;
end;
begin
  InitDeque(Deque);
  Write('Введите количество чисел для записи: ');
  ReadLn(Count);
  AssignFile(InputFile, 'C:\Users\egork\Desktop\input.txt');
  Rewrite(InputFile);
  for I := 1 to Count do
  begin
    write('Введите число ', I, ': ');
    ReadLn(Number); 
    PushBack(Deque, Number); 
    WriteLn(InputFile, Number); 
  end;
  CloseFile(InputFile); 
  AssignFile(OutputFile, 'C:\Users\egork\Desktop\output.txt');
  Rewrite(OutputFile);
  for I := Count downto 1 do
  begin
    PopBack(Deque, Number); 
    WriteLn(OutputFile, Number); 
  end;
  CloseFile(OutputFile); 
  writeLn('Числа успешно записаны и выведены в обратном порядке.'); 
end.
