create or replace trigger fine after delete on bookissue_
for each row
declare
cursor c1 select price from bookissue_ where bid=old.bid;
cr1 c1%rowtype;
x number(9);

begin
open c1
fetch c1 into cr1;
x:=months_between(sysdate+70,:old.dreturn)
if(x=1)
then 
update student_ set fine=((cr1.price)*0.05);
end if;
if(x=2)
then 
update student_ set fine=((cr1.price)*0.3);
end if;
if(x>2)
then 
update student_ set fine=((cr1.price)*0.5);
end if;
close c1;
end fine;
/