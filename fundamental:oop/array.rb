a = ["hey", "there", "whats", "up"]
b = [3, 2, 3, 5, 6, 32, 434, 6]

puts a.at(2)
# searches for what's at the second index
puts a.delete("hey")
puts a
# returns what is deleted
puts a.reverse
puts b.length
puts b.sort
puts a.slice(-1)
# slice at index not including index, will take out
puts a.slice(0,2)
# slice at index and length
puts a.slice(1...2)
# slice a range
puts b.shuffle
puts a.join("*")
puts a.insert(3, 'YO')
# insert(index, value )
puts b.values_at(3..5)
# returns an array with values specified in the param
# e.g. a = %w{cat dog bear}; puts a.values_at(1,2).join(' and ') #=> "dog and bear"
