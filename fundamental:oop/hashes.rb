#
# Challenge: Useful Methods
# Go ahead and try the following methods:
#
# .delete(key) => deletes and returns a value associated with the key
# e.g. h = {:first_name => "Coding", :last_name => "Dojo"}; h.delete(:last_name); print h      #=> [:first_name, "Coding"]
# .empty? => returns true if hash contains no key-value pairs
# .has_key?(key) => true or false
# .has_value?(value) => true or false

hash = {'a' => 1, 'b' => 2 }
puts hash.delete('a')
puts hash.empty?
puts hash.has_key?('b')
puts hash.has_value?(3)
