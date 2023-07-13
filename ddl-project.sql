-- dropping
drop table profile, social, registered_user, private_msg,
	public_msg, content, vod, stream, views, subscribes, 
	donates, follows;
drop domain uint_default, uri;

-- domains
create domain uint_default as int 
	default 0 check (value >= 0);
create domain uri as varchar(100);

-- tables
create table registered_user(
	username varchar(30) primary key,
	email varchar(50) unique not null,
	password varchar(256) not null, -- hashate
	bits_wallet uint_default not null,
	phone_number decimal(13) unique not null,
	birthday date not null
);
create table profile(
	owner varchar(30) primary key
		references registered_user(username)
			on update cascade
			on delete cascade,
	number_stream uint_default not null,
	minutes_trasmitted uint_default not null,
	avarege_spectators_count uint_default not null,
	is_affiliate bool default false not null,
	number_followers uint_default not null,
	description varchar(1000),
	trailer_uri uri,
	image_uri uri
);
create table tag(
	tag_name varchar(30) primary key
);

create table category(
	category_name varchar(30) primary key
);
create table content(
	uri_of_content uri primary key,
	creator varchar(30) not null
		references profile(owner)
			on update cascade
			on delete cascade,
	category_name uri
		references category(category_name)
			on update cascade
			on delete cascade,
	title varchar(140) not null,
	duration interval hour to second(3) default '0 seconds' not null
);
create table social(
	uri_social uri,
	social_profile varchar(30) not null
		references profile(owner)
			on update cascade
			on delete cascade,
	primary key(uri_social, social_profile)
);

create table private_msg(
	timestamp_msg timestamp,
	sender varchar(30)
		references registered_user(username)
			on update cascade
			on delete cascade,
	receiver varchar(30) not null
		references registered_user(username)
			on update cascade
			on delete cascade,
	body varchar(5000) not null,
	primary key (timestamp_msg, sender)
);
create table public_msg(
	timestamp_msg timestamp,
	sender varchar(30)
		references registered_user(username)
			on update cascade
			on delete cascade,
	receiver uri not null
		references content(uri_of_content)
			on update cascade
			on delete cascade,
	body varchar(5000) not null,
	primary key (timestamp_msg, sender)
);

create table vod(
	content_vod uri primary key 
		references content(uri_of_content)
			on update cascade
			on delete cascade,
	timestamp_upload timestamp not null,
	views_count uint_default not null,
	is_clip bool default false not null
);
create table stream(
	content_stream uri primary key
		references content(uri_of_content)
			on update cascade
			on delete cascade,
	timestamp_starting timestamp not null,
	average_spectators_count uint_default not null
);

create table views(
	username varchar(30)
		references registered_user(username)
			on update cascade
			on delete cascade,
	content uri
		references content(uri_of_content)
			on update cascade
			on delete cascade,
	primary key(username, content)
);
create table subscribes(
	username varchar(30)
		references registered_user(username)
			on update cascade
			on delete cascade,
	profile_to_subscribe varchar(30)
		references profile(owner)
			on update cascade
			on delete cascade,
	primary key(username, profile_to_subscribe)
);
create table donates(
	username varchar(30)
		references registered_user(username)
			on update cascade
			on delete cascade,
	profile_to_donate varchar(30)
		references profile(owner)
			on update cascade
			on delete cascade,
	primary key(username, profile_to_donate)
);
create table follows(
	username varchar(30)
		references registered_user(username)
			on update cascade
			on delete cascade,
	profile_to_follow varchar(30)
		references profile(owner)
			on update cascade
			on delete cascade,
	primary key(username, profile_to_follow)
);



create table has_tag(
	tag_name varchar(30)
		references tag(tag_name)
			on update cascade
			on delete cascade,
	uri_of_content uri
		references content(uri_of_content)
			on update cascade
			on delete cascade,
	primary key(tag_name, uri_of_content)
);

create table category_tag(
	tag_name varchar(30)
		references tag(tag_name)
			on update cascade
			on delete cascade,
	category_name uri
		references category(category_name)
			on update cascade
			on delete cascade,
	primary key(tag_name, category_name)
);
