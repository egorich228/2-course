type toy = record
  name: string;
  price: real;
  age: string;
end;
var toys:array[1..10] of toy;
n,i: integer;
begin
  writeln('Введите количество игрушек (максимум 10): ');
  readln(n);
  for i:= 1 to n do
  begin
    writeln('Введите название игрушки ', i, ':');
    readln(toys[i].name);
    writeln('Введите цену игрушки ', i, ':');
    readln(toys[i].price);
    writeln('Введите возрастной диапазон для игрушки ', i, ':');
    readln(toys[i].age);
  end;
  writeln('Данные об игрушках:');
  for i := 1 to n do
  begin
    with toys[i] do
    begin
      writeln('Игрушка ', i, ': Название: ', name, ', Цена: ', price, ' руб., Возрастной диапазон: ', age);
    end;
  end;
end.