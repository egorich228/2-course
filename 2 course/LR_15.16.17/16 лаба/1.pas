var
    i: integer;       
    i_ptr: ^integer;   
begin
    i := 2;          
    i_ptr := @i;     
    writeLn('Значение, находящееся по адресу i_ptr: ', i_ptr^);
end.
