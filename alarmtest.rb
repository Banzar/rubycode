alarmTimes = ["07:55", "07:57", "08:00"]
hourminute = "#{Time.now.hour}:#{Time.now.min}"
begin
alarmTimes.include?(hourminute)
	print "\a\a\a"
	puts "It is #{hourminute}"
end until (hourminute == "08:01")
