require 'yaml'

MESSAGES = YAML.load_file('calc_messages_en.yml')

puts MESSAGES.inspect
