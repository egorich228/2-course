program Simpson;

uses GraphABC;

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
    a, b, Sh: real;
    n, x0, y0, x, y: integer;
    choice: char;
    area, error, k, x1, y1: real;
    firstPoint: boolean;
  
begin
    SetWindowSize(1200,1000);
    repeat
       
        writeln('Меню:');
        writeln('1. Вычислить площадь фигуры');
        writeln('2. Визуализация');
        writeln('3. Выход');
        readln(choice);
        case choice of '1':
            begin          
                writeln('Введите нижний предел интегрирования (a): ');
                readln(a);
                writeln('Введите верхний предел интегрирования (b): ');
                readln(b);
                writeln('Введите количество подынтервалов: ');
                readln(n);
                area := SimpsonRule(a, b, n);
                error := error_estimate(a, b, n);
                writeln(' Площадь фигуры: ', area:0:6);
                writeln(' Оценка погрешности: ', error:0:6);                
            end;
            '2':
                begin              
                writeln('Введите нижний предел интегрирования (a).');
                readln(a);
                writeln('Введите верхний предел интегрирования (b).');
                readln(b);
                writeln('Введите количество подынтервалов.');
                readln(n);
                writeln('Введите масштаб (k-лучше от 5 до 30).');
                readln(k);
                area := SimpsonRule(a, b, n);
                error := error_estimate(a, b, n);
                clearwindow;
                x0:= 600;
                y0:= 500;
                line(10, y0, 1190, y0);
                line(x0, 10, x0, 990);
                writeln('Площадь фигуры: ', area:0:6);
                writeln('Оценка погрешности: ', error:0:6);
                
                x1 := a;
                firstPoint := True;
                
                while x1 < b do
                  begin 
                  y1 := f(x1);
                  x := x0 + round(x1*k);
                  y := y0 - round(y1*k);
                  SetPixel(x,y,clRed);
                  line (x,y,x,y0);
                  x1 := x1 + 0.001;
                  end;
                  Sh := (b-a)/n;
                  x1 := a;
                  MoveTo(x,y);
                  while x1 < b do
                  begin 
                  y1 := f(x1);
                  x := x0 + round(x1*k);
                  y := y0 - round(y1*k);
                  line (x,y,x,y0);
                  if not firstPoint then
                      begin
                          LineTo(x, y,clRed);
                      end
                      else
                      begin
                          MoveTo(x, y);
                          firstPoint := False
                      end;
                  LineTo(x, y0, clRed);
                  MoveTo(x,y);
                  x1 += Sh;
                end;
                end;
             '3':
                begin
                writeln('Вы завершили работу.'); 
                sleep(1000);
                closewindow;
                end
                   
            else
                writeln('Неверный выбор. Попробуйте снова.');
        end;

    until (choice = '3') or (choice = '2') or (choice = '1');
end.
