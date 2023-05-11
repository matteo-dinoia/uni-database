--Es. 5.1 Elencare i fornitori che forniscono parti disponibili a  Londra (sia con costrutto in/not in che con costrutto any/all)
select distinct  SP.snum from SP
	join P on P.pnum = SP.pnum 
	where SP.pnum = any (select P.pnum from P where P.city = 'London');
	
select distinct  SP.snum from SP
	join P on P.pnum = SP.pnum
	where SP.pnum in (select P.pnum from P where P.city = 'London');

--Es. 5.2 Elencare le città in cui non vi sono fornitori con status  minore della media (sia con in/not in che con costrutto any/all)
select distinct S.city from S
	where S.city not in (select S.city from S where S.status < (select avg(S.status) from S));
	
select distinct S.city from S
	where S.city <> all (select S.city from S where S.status < (select avg(S.status) from S));