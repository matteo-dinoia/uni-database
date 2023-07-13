SELECT sum(cast(number_followers = 0 as int)) from profile p
	group by number_followers;