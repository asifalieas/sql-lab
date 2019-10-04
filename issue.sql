create or replace procedure issue(a in number,b in number) is 
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
insert into bookissue_ values(cr1.sid,cr2.bid,sysdate,sysdate+20);

update booksavailable set noc=noc-1;

end if;
close c1;
close c2;
end issue;
