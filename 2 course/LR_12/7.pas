program zadanie7;
var 
m, n, i, s, j, sum,k: integer;
filetext,filetext1: text;
st:string;
begin
  assign(filetext,'C:\Users\egork\Desktop\z3.in.txt');
  reset(filetext);
  readLn(filetext, st);
  val(st,n,k);
  m:=1;
  sum:=0;
  for j:=1 to n do
    begin
      s:=0;
      for i := 2 to m div 2 do
        if m mod i = 0 then
          begin
          s+=1
          end;
      m := m + 1;
      if s+2=5 then
        sum:=sum+(m-1);
    end;
    assign(filetext1,'C:\Users\egork\Desktop\z3.out.txt');
    rewrite(filetext1);
    writeln(filetext1,sum);
    close(filetext);
    close(filetext1);
end.