type anketa = record
  fio:string;
  birth:string;
  kurs:1..5;
end;
  var student: array[1..10] of anketa;
  n,i:integer;
  begin
    writeln('Введите количество студентов (максимум 10):');
    readln(n);
  for i := 1 to n do
  begin
    writeln('Введите ФИО ', i, ':');
    readln(student[i].fio);
    writeln('Введите дату рождения ', i, ':');
    readln(student[i].birth);
    writeln('Введите курс ', i, ':');
    readln(student[i].kurs);
  end;
  writeln('Анкетные данные студентов:');
  for i := 1 to n do
  begin
    writeln('Студент ', i, ': ', student[i].fio, ', Дата рождения: ', student[i].birth, ', Курс: ', student[i].kurs);
  end;
  end.
