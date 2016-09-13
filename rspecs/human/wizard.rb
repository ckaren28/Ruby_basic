require_relative "humanI"
class Wizard < Human
    def initialize
        @health = 50
        @intelligence = 25
    end
    def heal
        @health += 10
    end
    def fireball(object)
        object.health -= 20
    end
end

puts Wizard.ancestors
