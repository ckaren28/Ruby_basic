a = {:first_name => "Michael", :last_name => "Choi"}
b = {:first_name => "John", :last_name => "Supsupin"}
c = {:first_name => "KB", :last_name => "Tonel"}
d = {:first_name => "Jessie", :last_name => "De Leon"}
e = {:first_name => "Jaybee", :last_name => "Balog"}
names = [a, b, c, d, e]
count = names.length

puts "You got #{count} names in the 'names' array."
#
# names.each{ puts "The name is %{first_name}"}
# can only do in ruby 1.9

names.each{|name| puts "The name is #{name.values.join(" ")}"}
