var
  Numbers: array of integer;
  Count, totalTime, time1, time2, time3, time4: integer;

function BubbleSort(var arr: array of integer; ascending: boolean): boolean;
var
  i, j, temp: integer;
  swapped: boolean;
begin
  Result := False;
  Count := Length(arr);
  for i := 0 to Count - 1 do
  begin
    swapped := False;
    for j := 0 to Count - 2 - i do
    begin
      // Сравнение для сортировки по возрастанию или убыванию
      if (ascending and (arr[j] > arr[j + 1])) or (not ascending and (arr[j] < arr[j + 1])) then
      begin
        temp := arr[j];
        arr[j] := arr[j + 1];
        arr[j + 1] := temp;
        swapped := True;
      end;
    end;
    if not swapped then Break; // Если не было обменов, массив отсортирован
  end;
  Result := True;
end;

function QuickSort(var arr: array of integer; ascending: boolean; left, right: integer): boolean;
var
  i, j, pivot, temp: integer;
begin
  if left < right then
  begin
    pivot := arr[(left + right) div 2];
    i := left;
    j := right;
    repeat
      // Сравнение для сортировки по возрастанию или убыванию
      while (ascending and (arr[i] < pivot)) or (not ascending and (arr[i] > pivot)) do Inc(i);
      while (ascending and (arr[j] > pivot)) or (not ascending and (arr[j] < pivot)) do Dec(j);
      if i <= j then
      begin
        temp := arr[i];
        arr[i] := arr[j];
        arr[j] := temp;
        Inc(i);
        Dec(j);
      end;
    until i > j;
    QuickSort(arr, ascending, left, j);
    QuickSort(arr, ascending, i, right);
  end;
  Result := True;
end;

procedure ReadDataFromFile(const FileName: string);
var
  f: TextFile;
  num: integer;
begin
  AssignFile(f, FileName);
  Reset(f);
  Count := 0;

  while not EOF(f) do
  begin
    Read(f, num);
    SetLength(Numbers, Count + 1);
    Numbers[Count] := num;
    Inc(Count);
  end;

  CloseFile(f);
end;

procedure WriteDataToFile(const FileName: string);
var
  f: TextFile;
  i: integer;
begin
  AssignFile(f, FileName);
  Rewrite(f);

  for i := 0 to Count - 1 do
    Write(f, Numbers[i], ' ');

  CloseFile(f);
end;

begin
  ReadDataFromFile('C:\Users\egork\Desktop\ввод чисел.txt'); 

  // пузырек
  time1 := Milliseconds;
  BubbleSort(Numbers, True);
  time2 := Milliseconds;
  totalTime := time2 - time1;
  writeln(totalTime, ' милисекунд');
  
  WriteDataToFile('C:\Users\egork\Desktop\Результат пузырьком.txt'); 

  // быстрая сортировка
  time3 := Milliseconds;
  QuickSort(Numbers, False, Low(Numbers), High(Numbers));
  time4 := Milliseconds;
  totalTime := time4 - time3;
  writeln(totalTime, ' милисекунд');
  WriteDataToFile('C:\Users\egork\Desktop\Результат быстрой сотрировки.txt'); 

end. 