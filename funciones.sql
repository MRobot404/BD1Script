create or replace function f_incremento (avalor number)
return number
is
begin
return avalor+(avalor*0.1);
end;

select idrenta, valor, f_incremento(valor) from renta;

create or replace function f_detalles (avalor number)
return varchar
is
detalles varchar(20);
begin
detalles:='';
if avalor<=1000 then
detalles:='economico';
else detalles:='costoso';
end if;
return detalles;
end;

select idrenta, valor, f_detalles(valor) from renta;
