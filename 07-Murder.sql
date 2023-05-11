select * from crime_scene_report csr 
	where csr.city = 'SQL City' and csr.type = 'murder' 
		and csr.date = 20180115;
-- Security footage shows that there were 2 witnesses. 
-- The first witness lives at the last house on "Northwestern Dr". 
-- The second witness, named Annabel, lives somewhere on "Franklin Ave".
	
select * from person p
	where (p."name" like  '%Annabel%' and p.address_street_name = 'Franklin Ave') or
		(p.address_street_name = 'Northwestern Dr' 
		and p.address_number >= (select max(address_number) from person p2 where p2.address_street_name = 'Northwestern Dr'));
		
-- id 14887 Morty Schapiro 16371 Annabel Miller
select * from person p 
	join interview i  on i.person_id = p.id
	where p.id = 14887 or p.id = 16371; 
-- Morty
	-- I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. 
	-- The membership number on the bag started with "48Z". Only gold members have those bags. 
	-- The man got into a car with a plate that included "H42W".
-- Annabel
	-- I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th.
select * from person p
	join get_fit_now_member mem on mem.person_id = p.id and mem.id like '48Z%'
	join get_fit_now_check_in ckin on ckin.membership_id =mem.id and ckin.check_in_date = 20180109
	join drivers_license dl on dl.id = p.license_id and dl.plate_number  like '%H42W%';

select * from facebook_event_checkin fec2 
	join person p2 on p2.id = fec2.person_id
	where fec2.event_name = any (select fec.event_name from person p 
		join facebook_event_checkin fec  on fec.person_id = p.id
		where p.id = 14887 or p.id = 16371);

INSERT INTO solution VALUES (1, 'Jeremy Bowers');
SELECT value FROM solution;
-- Congrats, you found the murderer! But wait, there's more... 
-- If you think you're up for a challenge, try querying the interview transcript of the 
	-- murderer to find the real villain behind this crime. 
-- If you feel especially confident in your SQL skills, try to complete this final step with no more than 2 queries.
	
select * from person p 
	join interview i on i.person_id =p.id
	where p."name" = 'Jeremy Bowers';
-- I was hired by a woman with a lot of money. 
-- I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). 
-- She has red hair and she drives a Tesla Model S. I know that she attended the SQL Symphony Concert 3 times in December 2017.

select p.id, p.name from person p 
	join drivers_license dl on dl.id = p.license_id and dl.height >= 65 and dl.height <= 67 and dl.hair_color = 'red'
		and dl.car_model like '%Model S%'
	join facebook_event_checkin fec on fec.person_id =p.id and fec.event_name ='SQL Symphony Concert'
	group by p.id, p.name
	having count(*) = 3;

--drop table crime_scene_report, drivers_license , facebook_event_checkin , get_fit_now_check_in , get_fit_now_member , income , interview , person , solution;