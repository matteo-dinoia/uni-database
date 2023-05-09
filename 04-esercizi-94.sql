--4.1a
select S.sname, sum(qty) from S, SP, P 
	where S.snum =SP.snum and P.pnum =SP.pnum
	and P.color ='Red'
	group by S.snum, S.sname;

--4.1b
select S.sname, coalesce (sum(qty), 0) 
	from S
		left join SP on  S.snum =SP.snum
		left join P on P.pnum =SP.pnum
	where P.color ='Red' or P.color is null
	group by S.snum, S.sname;

--4.1c
select S.sname, coalesce (sum(qty), 0) 
	from SP
		join P on P.pnum = SP.pnum and P.color ='Red'
		right join S on S.snum =SP.snum
	group by S.snum, S.sname;

select S.sname, coalesce (sum(qty), 0) 
	from S
		left join 
			(SP join P on P.pnum =SP.pnum and P.color = 'Red')
		on  S.snum =SP.snum
	group by S.snum, S.sname;

--4.2
select S.city, sum(SP.qty)
	from S 
		join SP on S.snum = SP.snum
	where SP.qty > 100
	group by S.city
	having sum(SP.qty) >=1000;
	
--4.3
select S.city 
	from P P1 
		join P P2 on  P1.color < P2.color
		join SP SP1 on P1.pnum = SP1.pnum
		join SP SP2 on P2.pnum = SP2.pnum and SP1.snum = SP2.snum 
		join S on SP1.snum =S.snum
	group by S.city  having count(distinct S.snum) >= 2;
	
