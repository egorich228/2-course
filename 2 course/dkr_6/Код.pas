const
  MAX = 5;  
type
  TQueue = record
    items: array[1..MAX] of integer;
    nach, kon: integer;
  end;
var
  queue: TQueue;
  choice, item: integer;

procedure initialize(var q: TQueue);
begin
  q.nach := 0;
  q.kon := 0;
end;

function empty(var q: TQueue): boolean;
begin
  empty := (q.nach = 0);
end;

function full(var q: TQueue): boolean;
begin
  full := (q.kon = MAX);
end;

procedure add(var q: TQueue; item: integer);
begin
  if full(q) then
    writeln('Очередь переполнена!')
  else
  begin
    if empty(q) then
      q.nach := 1;
    q.kon := q.kon + 1;
    q.items[q.kon] := item;
    writeln('Элемент ', item, ' добавлен в очередь.');
  end;
end;

procedure delete(var q: TQueue);
begin
  if empty(q) then
    writeln('Очередь пуста!')
  else
  begin
    writeln('Элемент ', q.items[q.nach], ' удален из очереди.');
    if q.nach = q.kon then
    begin
      q.nach := 0;
      q.kon := 0;
    end
    else
    begin
      for var i := q.nach + 1 to q.kon do
        q.items[i - 1] := q.items[i];
      q.kon := q.kon - 1; 
    end;
  end;
end;

procedure display(var q: TQueue);
var
  i: integer;
begin
  if empty(q) then
    writeln('Очередь пуста.')
  else
  begin
    writeln('Содержимое очереди:');
    for i := q.nach to q.kon do
      write(q.items[i], ' ');
    writeln;
  end;
end;

begin
  initialize(queue);
  repeat
    writeln;
    writeln('Меню:');
    writeln('1. Добавить элемент в очередь');
    writeln('2. Удалить элемент из очереди');
    writeln('3. Показать содержимое очереди');
    writeln('4. Выйти');
    write('Выберите действие: ');
    readln(choice);
    case choice of
      1: begin
           write('Введите элемент для добавления: ');
           readln(item);
           add(queue, item);
         end;
      2: delete(queue);
      3: display(queue);
      4: writeln('Выход из программы.');
      else writeln('Неверный выбор! Попробуйте снова.');
    end;
  until choice = 4;
end.