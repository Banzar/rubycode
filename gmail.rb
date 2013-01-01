require 'net/pop'

directory_name = "inbox"
Dir.mkdir(directory_name) unless File.exists?(directory_name)

print "Enter gmail account(jsmith@gmail.com): "
email = gets.chop

print "Enter password: "
password = gets.chop

print "Search mail for(blank for all mail): "
parse_for = gets.chop


Net::POP3.enable_ssl(OpenSSL::SSL::VERIFY_NONE)  
Net::POP3.start('pop.gmail.com', 995, email, password) do |pop|

	if pop.mails.empty?
		puts "No new mail!"
	else
		n = 1
		pop.each_mail do |msg|
			if msg.pop.include?(parse_for)
				puts "Message number #{n} being downloaded."
				File.open("inbox/#{n}", "w") do |f|
					msg.pop do |segment|
						f.write segment
					end
					n += 1
				end
			end
		end
		puts "Finished!"
	end
end 
