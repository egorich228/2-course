unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    minus: TButton;
    umnozh: TButton;
    podelit: TButton;
    Button13: TButton;
    zapyat: TButton;
    plus: TButton;
    ravno: TButton;
    obratnoe: TButton;
    sqr: TButton;
    Sqrt: TButton;
    Button2: TButton;
    C: TButton;
    ce: TButton;
    nazad: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Edit1: TEdit;
    procedure ravnoClick(Sender: TObject);
    procedure obratnoeClick(Sender: TObject);
    procedure sqrClick(Sender: TObject);
    procedure SqrtClick(Sender: TObject);
    procedure CClick(Sender: TObject);
    procedure ceClick(Sender: TObject);
    procedure nazadClick(Sender: TObject);
    procedure ClickBut (Sender: TObject);
    procedure ClickZnak (Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  a,b,c: integer;
  znak:string;

implementation

{$R *.lfm}

{ TForm1 }
procedure TForm1.ClickZnak (Sender: TObject);   //обработка нажатия знака операции
begin
   try
    a := StrToFloat(Edit1.Text);
    Edit1.Clear;
    znak :=(Sender as TButton).Caption;
  except
    on E: Exception do
      Edit1.Text:= 'ошибка';
  end;
end;
procedure TForm1.ClickBut (Sender: TObject); //обработка нажатия цифры
begin
  try
  Edit1.Text:= Edit1.Text + (Sender as TButton).Caption;
  except
   on E:Exception do
   Edit1.text:= 'ошибка';
  end;
end;

procedure TForm1.nazadClick(Sender: TObject);  //удаление последнего символа
var
 str: String;
begin
 try
 str:= Edit1.Text;
 if str <> '' then
 Delete(str, Length(str),1);
 Edit1.text := str;
 except
  on E: Exception do
  Edit1.text:= 'ошибка';
 end;
end;

procedure TForm1.ceClick(Sender: TObject);   //очистка поля ввода
begin
try
  Edit1.clear;
  except
   on E:Exception do
   Edit1.text:= 'ошибка';
end;
end;

procedure TForm1.ravnoClick(Sender: TObject);  //вычисление результата
begin
try
  b:= StrToFloat (Edit1.text);
  Edit1.clear;
  try
  case znak of
  '+' :c:= a+b;
  '-' :c:= a-b;
  '*' :c:= a*b;
  '/' :
    begin
      if b=0 then
      raise Exception.Create('Деление на ноль');
      c:=a/b;
    end;
  end;
  Edit1.text:= FloatToStr(c);
  except
  on E: Exception do
  Edit1.text:='ошибка';
  end;
   except
   on E:Exception do
   Edit1.text:='ошибка';
   end;
end;

procedure TForm1.obratnoeClick(Sender: TObject);   // вычисление обратного числа
begin
try
  a:= StrToFloat (Edit1.text);
  if a=0 then
  raise Exception.Create('Деление на ноль');
  a:=1/(a);
  Edit1.text := FloatToStr(a);
  a:=0;
  except
  on E:Exception do
  Edit1.text:='ошибка';
end;
end;

procedure TForm1.sqrClick(Sender: TObject);   //возведение в степень
begin
  try
  a:= StrToFloat (Edit1.text);
  if (a>1E150) or (a<-1E150) then
  raise Exception.Create ('слишком большое число');
  a:=a*a;
  if (a>1E150) or (a<-1E150) then
  raise Exception.Create ('переполнение');
  Edit1.text := FloatToStr(a);
  a:=0;
  except
  on E: Exception do
  Edit1.text:='ошибка';
  end;
end;

procedure TForm1.SqrtClick(Sender: TObject);   //вычисление квадратного корня
begin
  try
  a:= StrToFloat (Edit1.text);
  if a<0 then
  raise Exception.Create('Корень из отрицвательного числа');
  a:=sqrt(a);
  Edit1.text := FloatToStr(a);
  a:=0;
  except
  on E: Exception do
  Edit1.text:='ошибка';
  end;
end;

procedure TForm1.CClick(Sender: TObject); //полный сброс калькулятора
begin
  try
  Edit1.clear;
  a:=0;
  b:=0;
  C:=0;
  except
  on E: Exception do
  Edit1.text:='ошибка';
  end;
end;
end.

