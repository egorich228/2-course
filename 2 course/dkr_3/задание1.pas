program Simpson;

uses crt;

function f(x: real): real;
begin
    f := power(x, 3) - power(x, 2) + x + 18;
end;

function SimpsonRule(a, b: real; n: integer): real;
var
    h, integral: real;
    i: integer;
begin
    if n mod 2 = 1 then
        n := n + 1; // Кол-во подынтервалов должно быть четное
    h := (b - a) / n;
    integral := f(a) + f(b);
    
    for i := 1 to n - 1 do
    begin
        if i mod 2 = 0 then
            integral := integral + 2 * f(a + i * h)
        else
            integral := integral + 4 * f(a + i * h);
    end;
    
    integral := integral * (h / 3);
    SimpsonRule := integral;
end;

function error_estimate(a, b: real; n: integer): real; //погрешность
var
    second_derivative_max, x, error: real;
    i: integer;
begin
    for i := 0 to n do
    begin
        x := a + i * (b - a) / n;
        if (6 * x + 4) > second_derivative_max then // первообразная 2-ого порядка от начальной функции
            second_derivative_max := 6 * x + 4;
    end;

    error := (b - a) ** 5 / (180 * n ** 4) * second_derivative_max; // Формула для вычисления погрешности
    error_estimate := error;
end;


var
    a, b: real;
    n: integer;
    choice: char;
    area, error: real;

begin
    repeat
        
        writeln('Меню:');
        TextBackground(2);
        writeln('1. Вычислить площадь фигуры');
        TextBackground(4); 
        writeln('2. Выход');
        TextBackground(0);
        write('Выберите опцию: ');
        readln(choice);
        case choice of '1':
            begin
               
                ClrScr;
                TextColor(5);
                write('Введите нижний предел интегрирования (a): ');
                readln(a);
                write('Введите верхний предел интегрирования (b): ');
                readln(b);
                write('Введите количество подынтервалов: ');
                readln(n);

                area := SimpsonRule(a, b, n);
                error := error_estimate(a, b, n);

                writeln('Площадь фигуры: ', area:0:6);
                writeln('Оценка погрешности: ', error:0:6);
            end;
            
            '2':
               
                writeln('Выход из программы.');

            else
                TextColor(4);
                writeln('Неверный выбор. Попробуйте снова.');
        end;

    until choice = '2';
end.
