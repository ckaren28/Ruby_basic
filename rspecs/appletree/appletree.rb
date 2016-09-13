class AppleTree
    attr_accessor :height, :age, :apples
    def initialize
        @height = 120
        @age = 9
        @apples = 70
    end
    def count_apples
        @apples
    end
    def year_gone_by
        if @age > 10
            @age += 1
            @height -= 5
        else
            if @age <= 3
                @age += 1
                @height += 5
            else
                @age += 1
                @height += 5
                @apples += 10
            end
        end
        "#{@height} ft, #{@age} yrs, #{@apples} apples"
    end
    def pick_apples
        @apples = 0
    end
end
