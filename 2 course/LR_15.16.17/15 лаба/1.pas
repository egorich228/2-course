type anketa = record
fio: string;
birth: string;
kurs: 1..5;
end;
var student:anketa;
  begin
    writeln('Введите ФИО:');
    readln(student.fio);
    writeln('Введите дату рождения:');
    readln(student.birth);
    writeln('Введите курс (1-5):');
    readln(student.kurs);
    writeln('ФИО: ', student.fio);
    writeln('Дата рождения: ', student.birth);
    writeln('Курс: ', student.kurs);
  end.
