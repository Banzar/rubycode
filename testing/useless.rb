require 'yaml'

output = File.new('output.yml', 'r')
steps = YAML.load(output.read)

day = rand(300)

puts day
puts steps[day]