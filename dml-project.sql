truncate profile, social, registered_user, private_msg,
	public_msg, content, vod, stream, views, subscribes, 
	donates, follows, has_tag, category_tag, category, tag;

--registered user
insert into registered_user(username, email, password, birthday, phone_number) 
	values ('ABoy', 'aboy@gmail.com', 'password123', '31/01/2001', 331221323);
insert into registered_user(username, email, password, birthday, phone_number) 
	values ('Test Test', 'test@hotmail.com', 'testtest1!', '1.1.1', 1111111111);
insert into registered_user(username, email, password, bits_wallet, birthday, phone_number) 
		values ('rich', 'rich@lol.com', 'weruy32ewfew!3', 1000000, '23/07/1946', 394374945);
insert into registered_user(username, email, password, birthday, phone_number) 
		values ('phony', 'phony@gmail.com', 'sadasd321£', '01/12/2023', 393492634100);
--select * from registered_user;

-- Profile
insert into profile(owner) values ('ABoy');
insert into profile(owner, description, trailer_uri, image_uri) 
		values ('Test Test', 'Test description', 'fake_host.com/23145ioudfg', 'fake_host.com/sarfsdgsdyvidsydg7');
insert into profile(owner, description) values ('rich', '$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$');
--select * from profile;

--Social
insert into social(uri_social, social_profile) values ('www.fb.com/@sadfgh','ABoy');
insert into social(uri_social, social_profile) values ('www.ig.com/sahgcsgjs','ABoy');
insert into social(uri_social, social_profile) values ('www.fb.com/@test', 'Test Test');
--select * from social;

--Category
insert into category values ('just talking');
insert into category values ('random');
insert into category values ('minecraft');

--Tag
insert into tag values ('IRL');
insert into tag values ('MMO');
insert into tag values ('adventure game');
insert into tag values ('survival');
insert into tag values ('no sound');

-- Content
insert into content(uri_of_content, creator, title, duration, category_name) 
		values ('fake_host.com/23rewsdf343', 'rich', 'I am rich boyys!', '3 hours 10 minutes', 'minecraft'); 
insert into content(uri_of_content, creator, title, duration) 
		values ('fake_host.com/23rewsdf344', 'rich', 'I am rich boyys (summary)!', '4.324 seconds'); 
insert into content(uri_of_content, creator, title, category_name) 
		values ('fake_host.com/23rasdsadsa', 'Test Test', 'Test Title', 'just talking'); 

-- Vod
insert into vod(content_vod, timestamp_upload, views_count) 
		values ('fake_host.com/23rewsdf343', '23/4/2002', 2);
insert into vod(content_vod, timestamp_upload, is_clip) 
		values ('fake_host.com/23rewsdf344', '24/4/2002', true);

-- Stream
insert into stream(content_stream, timestamp_starting)
		values ('fake_host.com/23rasdsadsa', pg_catalog.now());

--has_tag
insert into has_tag (tag_name, uri_of_content) 
		values ('no sound', 'fake_host.com/23rasdsadsa');

--category_tag
insert into category_tag (category_name, tag_name) values ('just talking', 'IRL');
insert into category_tag (category_name, tag_name) values ('minecraft', 'MMO');
insert into category_tag (category_name, tag_name) values ('minecraft', 'adventure game');
insert into category_tag (category_name, tag_name) values ('minecraft', 'survival');
	
-- Subscribes
insert into subscribes(username, profile_to_subscribe) 
		values ('ABoy', 'rich');
insert into subscribes(username, profile_to_subscribe) 
		values ('Test Test', 'rich');

-- Follows
insert into follows(username, profile_to_follow) 
		values ('rich', 'ABoy');
insert into follows(username, profile_to_follow) 
		values ('Test Test', 'rich');

-- Donates
insert into donates(username, profile_to_donate) 
		values ('phony', 'rich');
insert into donates(username, profile_to_donate) 
		values ('Test Test', 'rich');
insert into donates(username, profile_to_donate) 
		values ('phony', 'Test Test');

-- Views
insert into views(username, content) 
		values ('phony', 'fake_host.com/23rewsdf343');
insert into views(username, content) 
	values ('phony', 'fake_host.com/23rasdsadsa');
insert into views(username, content) 
	values ('Test Test', 'fake_host.com/23rasdsadsa');

-- Private_msg
insert into private_msg(timestamp_msg, sender, receiver, body)
		values (pg_catalog.now(),'phony', 'rich', 'Please make a giveaway...');
insert into private_msg(timestamp_msg, sender, receiver, body)
		values (pg_catalog.now(),'rich', 'phony', 'No...');

-- Public_msg
insert into public_msg(timestamp_msg, sender, receiver, body)
		values (pg_catalog.now(),'phony', 'fake_host.com/23rasdsadsa', 'First');
insert into public_msg(timestamp_msg, sender, receiver, body)
		values ('23/05/23 19:00', 'rich', 'fake_host.com/23rasdsadsa', 'Nice test stream...');

 
	
	
	
-- Modifiche e cancellazioni
	
-- Cascading of modyfication and deletion
update registered_user 
	set username = 'phony2' where username = 'phony';
delete from registered_user 
	where username = 'phony2';
update registered_user 
	set username = 'TestTest' where username = 'Test Test';	
delete from content 
	where uri_of_content = 'fake_host.com/23rewsdf343';;

--Normal and not values
update profile set number_followers = 1000
	where owner = 'rich';
select * from profile;
update profile set number_followers = -1000  
	where owner = 'TestTest'; -- doesn't work as expected

--Foreign key (existing and not)
update content set category_name = 'minekraft' 
	where uri_of_content = 'fake_host.com/23rewsdf344'; --doesn't work as intended
update content set category_name = 'minecraft' 
	where uri_of_content = 'fake_host.com/23rewsdf344';

--Alex add immagini e 2 dml