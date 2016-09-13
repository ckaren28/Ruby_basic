class Human
    attr_accessor :strength, :intelligence, :stealth, :health
    def initialize
        @strength = 3
        @intelligence = 3
        @stealth = 3
        @health = 100
    end
    def attack(something)
        if something.class.ancestors.include?(Human)
            something.health -= 10
            true
        else
            false
        end
    end
    def show_health
        puts @health
    end

end

class Wizard < Human
    def initialize
        @health = 50
        @intelligence = 25
        super
    end
    def heal
        @health += 10
    end
    def fireball(object)
        object.health -= 20
    end
end

class Ninja < Human
    def initialize
        @stealth = 175
        super
    end
    def steal
        attack(something)
        @health += 10
    end
    def get_away
        @stealth -= 15
    end
end

class Samuri < Human
    @@total_samuri
    def initialize
        @health = 200
        @@total_samuri += 1
        super
    end
    def death_blow(object)
        object.health = 0
    end
    def meditate
        @health = 200
    end
    def how_many
        puts @@total_samuri
    end
end
