--ES in 93 pdf (ricordo no duplicati e uso chiave se non specificato)

--es 3.1
select S.*, SP.qty
	from S left join SP on S.snum = SP.snum
	where S.status > 20;

--es 3.2
select distinct  P.pname, S.city  from P 
	left join SP on P.pnum = SP.pnum
	left join S on S.snum = SP.snum 
	where P.color = 'Green';

--es 3.3
select distinct S.sname, SP.qty from S
	left join SP on S.snum = SP.snum
	where SP.qty < 200 or SP.qty is null; 

--es 3.4
select P1.pnum, P2.pnum, P1.city from P P1
	join P P2 on P1.city = P2.city
	where P1.pnum < P2.pnum and P1.color <> P2.color;

--es 3.5
select distinct S.snum, P1.pnum, P1.pname, P2.pnum, p2.pname
	from S
		join SP SP1 on S.snum = SP1.snum
		join SP SP2 on S.snum = SP2.snum
		join P P1 on P1.pnum =SP1.pnum 
		join P P2 on P2.pnum =SP2.pnum 
	where P1.pnum < P2.pnum;
