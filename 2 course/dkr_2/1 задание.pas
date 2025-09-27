program zadanie1;

var
  arr: array[1..100] of integer;
  n, i, minIndex, maxIndex, sum: integer;

begin
  write('Введите количество элементов массива (макс. 100): ');
  readLn(n);

  writeLn('Введите элементы массива:');
  for i := 1 to n do
  begin
    read(arr[i]);
  end;

  minIndex := 1;
  maxIndex := 1;

  for i := 2 to n do
  begin
    if arr[i] < arr[minIndex] then
      minIndex := i;
    if arr[i] > arr[maxIndex] then
      maxIndex := i;
  end;

  if minIndex > maxIndex then
  begin
    minIndex := minIndex + maxIndex; 
    maxIndex := minIndex - maxIndex;
    minIndex := minIndex - maxIndex;
  end;

  sum := 0;
  for i := minIndex + 1 to maxIndex - 1 do
  begin
    sum := sum + arr[i];
  end;

  writeLn('Сумма элементов между минимальным и максимальным: ', sum);
end.
