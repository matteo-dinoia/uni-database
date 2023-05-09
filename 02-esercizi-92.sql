--Es 2.0?
select * from s;
select * from s where sname like '%h%';
select * from s where sname like '%S%' or sname like '%s%';
select * from s where sname like '%a%s';
select * from s where sname like '%a%' and sname like '%e%';
select * from s where sname like '%a%' and sname like '%e%'
	and sname like '%i%'and sname like '%o%'and sname like '%u%';
select * from s, p where sname = pname;
select * from p where p.city like '____%';

--Es 2.1
select * from p where p.color = 'Red' and (p.weight >= 13 and p.weight <= 17);

--Es 2.2
select * from s where s.city = 'Athens' and s.status < 20;

--Es 2.3
select p.pname, p.color, p.weight, s.sname from s, p where p.city = s.city;

--Es 2.4
select distinct s.sname from s, sp, p 
	where s.snum = sp.snum and p.pnum = sp.pnum 
		and sp.qty >= 300
		and (p.pname = 'Bolt' or p.pname ='Nut')
	order by s.sname asc;

--ES 2.5
select distinct s.sname, s.status from s, sp, p
	where s.snum = sp.snum and p.pnum = sp.pnum  
		and (p.weight < 14 or p.weight > 17)
	order by s.status desc;