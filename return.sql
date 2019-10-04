create or replace function return_(a in number,b in number) return number is 
	cursor c1 select sid from student_ where sid=a;
	cursor c2 select bid from booksavailable where bid=b;
	cr1 c1%rowtype;
	cr2 c2%rowtype;
begin
open c1
open c2 
fetch c1 into cr1;
fetch c2 into cr2;
if ((sid>0)and(bid>0))
then 
delete from bookissue_ where bid=b and sid=a;
	update book set noc=noc+1 where (bid=b);
end if;
close c1;
close c2;
return 0;
end return_;
/