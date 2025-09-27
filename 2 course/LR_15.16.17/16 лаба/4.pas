type
  PNode = ^TNode; // Объявление указателя на узел
  TNode = record 
    Data: integer; 
    Next: PNode;   // Указатель на следующий узел
  end;
var
    Head: PNode; // Указатель на голову списка
    Current: PNode; // Указатель для текущего узла при обходе списка
    MaxValue, MinValue: integer; 
    i, N, Value: integer; 
begin
    Head := nil; 
    write('Введите количество элементов в списке: '); 
    readLn(N); 
    for i := 1 to N do
    begin
        New(Current); // Выделение памяти для нового узла
        write('Введите элемент ', i, ': '); 
        readLn(Value); 
        Current^.Data := Value; // Заполнение данных в узле
        Current^.Next := Head; // Указатель на предыдущий элемент (или nil, если это первый элемент)
        Head := Current; // Обновление головы списка на новый узел
    end;
    if Head <> nil then
    begin
        MaxValue := Head^.Data; 
        MinValue := Head^.Data; 
        Current := Head; //начинаем с головы списка
        while Current <> nil do
        begin
            if Current^.Data > MaxValue then 
                MaxValue := Current^.Data;          
            if Current^.Data < MinValue then 
                MinValue := Current^.Data;           
            Current := Current^.Next;
        end;
        writeLn('Максимальный элемент в списке: ', MaxValue);
        writeLn('Минимальный элемент в списке: ', MinValue);
    end
    else
    begin
        writeLn('Список пуст.'); 
    end;
end.
