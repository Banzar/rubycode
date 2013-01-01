require 'rubygems'
require 'mechanize'

a = Mechanize.new
a.get('http://facebook.com') do |page|
	#Click the login link
	#login_page = a.click(page.link_with(:text => /Log In/))
	
	#Submit the login form
	my_page = a.form_with(:action => '/account/login.php') do |f|
		f.form_loginname = 'banzar'
		f.form_pw 		= '00bc5c3106'
	end.click_button
	
	my_page.links.each do |link|
		text = link.text.strip
		next unless text.length > 0
	puts text
	end
end