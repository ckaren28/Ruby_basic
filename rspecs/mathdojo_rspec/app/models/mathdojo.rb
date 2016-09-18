class Mathdojo
 attr_accessor :result, :sum
 def initialize
     @result = 0
     @sum = 0
 end
 def add *numbers
     @result += numbers.flatten.inject(:+)
     return self
 end
 def subtract *numbers
     @result -= numbers.flatten.inject(:+)
     return self
 end
def multiply_by_the_sum *numbers
    @sum += numbers.flatten.inject(:+)
    @result *= @sum
    return self
 end
 def reset
     @result = 1
     return self
 end
end
