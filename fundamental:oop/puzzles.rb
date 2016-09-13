arr = [3,5,1,2,7,9,8,13,25,32]

def puz1(arr)
    puts arr.inject(0){|sum, i| sum + i }
    print Array.new(arr.find_all{|i| i > 10})
end
 puz1(arr)

a = ["John", "KB", "Oliver", "Cory", "Matthew", "Christopher"]
def puz2(a)
    print a.shuffle
    print a.each{|i| puts i if i.length > 5}
end
 puts puz2(a)

alpha = ("a".."z").to_a
print alpha
randalph = alpha.shuffle
print randalph.last

print 10.times.map{Random.rand(55..100)}
x = 10.times.map{Random.rand(55..100)}
print x.sort
print x.minmax

puts 5.times.map { (65+rand(26)).chr }

print 10.times.map{ 5.times.map { (65+rand(26)).chr } }
