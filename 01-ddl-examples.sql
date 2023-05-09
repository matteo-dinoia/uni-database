/*drop table supply;
drop table suppliers;
drop table parts;
*/

create table suppliers(
	snum varchar(10) primary key,
	sname varchar(30),
	status integer null,
	city varchar(20)
);

create table parts(
	pnum varchar(10) primary key,
	pname varchar(30),
	color varchar(10),
	weight integer null,
	city varchar(20)
);

create table banana(
	pnum varchar(10) primary key,
	pname varchar(30),
	color varchar(10),
	weight integer null,
	city varchar(20)
);
drop table banana;


create table supply(
	snum varchar(10),
	pnum varchar(10),
	quantity integer,
	
	primary key(snum, pnum)
);

alter table supply add foreign key(snum) references suppliers(snum);
alter table supply add foreign key(pnum) references parts(pnum);
alter table supply alter 

insert into suppliers(snum, sname, status, city) values ('P1', 'Io', null, 'Turin');
insert into suppliers(snum, sname, status, city) values ('P2', 'Io2', 1, 'Turisadn');
insert into suppliers(snum, sname, status, city) values ('P3', 'Io3', null, 'Bah');
insert into suppliers(snum, sname, status, city) values ('P4', null, null, 'Bah');

insert into parts(pnum, pname, color, weight, city) values ('P1', 'Io', 'red',null, 'Turin');
insert into parts(pnum, pname, color, weight, city) values ('P2', 'Io2', 'blue', 1, 'Turisadn');
insert into parts(pnum, pname, color, weight, city) values ('P3', 'Io3', 'white', null, 'Bah');
insert into parts(pnum, pname, color, weight, city) values ('P4', null, 'red', null, 'Bah');

insert into supply(pnum, snum, quantity) values ('P1', 'S2', 10);

select * from suppliers;
select * from parts;

select * from suppliers, parts, supply where suppliers.snum = supply.snum  and parts.pnum =supply.pnum ;