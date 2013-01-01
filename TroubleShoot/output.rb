require 'yaml'

output = File.new('steps.yml', 'r')
steps = YAML.load(output.read)

puts steps["eachdo"]