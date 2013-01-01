require 'yaml'

testing = [nil, "One", "two", "Three", "Four"]

output = File.new('output.yml', 'w')
output.puts YAML.dump(testing)
output.close