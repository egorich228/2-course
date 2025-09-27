type
  TToy = record
    name: string;   
    price: real;    
    age: string;    
  end;
const
  MaxToys = 10; 
var
  toys: array[1..MaxToys] of TToy;
  i, count: integer;
  toyFile: file;
begin
  write('Введите количество игрушек (макс. ', MaxToys, '): ');
  readLn(count);
  if count > MaxToys then
    count := MaxToys;
  for i := 1 to count do
  begin
    write('Введите название товара (', i, '): ');
    readLn(toys[i].name);
    write('Введите цену товара (', i, '): ');
    readLn(toys[i].price);  
    write('Введите возрастной диапазон (', i, '): ');
    readLn(toys[i].age);
  end;
  assignFile(toyFile, 'C:\Users\egork\Desktop\4.txt');
  rewrite(toyFile);
  for i := 1 to count do
  begin
    write(toyFile, toys[i]);
  end;
  closeFile(toyFile);
  assignFile(toyFile, 'C:\Users\egork\Desktop\4.txt');
  reset(toyFile);
  writeLn('Данные о игрушках из файла:');
  i := 1;
  while not EOF(toyFile) and (i <= MaxToys) do
  begin
    read(toyFile, toys[i]);
    writeLn('Игрушка ', i, ':');
    writeLn('Название: ', toys[i].name);
    writeLn('Цена: ', toys[i].price:0:2);
    writeLn('Возрастной диапазон: ', toys[i].age);
    inc(i);
  end;
  closeFile(toyFile);
end.
