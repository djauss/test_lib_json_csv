require 'json'
load 'lib_json_to_csv.rb'

# Script
# "users.json" ; "users.csv"

json_file = JSON.parse(File.read(ARGV[0]))
csv_name = ARGV[1]

convert_json_to_csv(json_file, csv_name)
