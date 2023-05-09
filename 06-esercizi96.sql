--Es 6.1
select P1.pnum  from P P1 where 
	not exists (select * from P P2 where
		P1.weight < P2.weight);

select P1.pnum  from P P1 
	where 0 = (select count(*) from P P2 
					where P1.weight < P2.weight);
	
--Es 6.2
select distinct S.sname from s
	where not exists (select * from P 
		left join SP on SP.pnum = P.pnum and SP.snum = S.snum 
		where SP.snum is null);
	
--Es 6.3
select distinct S.sname from S
	where not exists (select * from P 
		join SP SP1 on SP1.pnum = P.pnum and SP1.snum = 'S2' 
		left join SP SP2 on SP1.pnum = SP2.pnum and S.snum =SP2.snum
		where SP2.snum is null);
	