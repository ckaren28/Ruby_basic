class Project
    attr_accessor :name, :description
    @@team

    def initialize(name, description)
        @name = name
        @description = description
        @@team = 0
    end


    def elevator_pitch
        puts "#{name}, #{description}"
    end

    def add_to_team
        @@team += 1
    end

end
project1 = Project.new("Project 1", "Description 1")
puts project1.name #prints out Project 1
project1.elevator_pitch #prints out 'Project 1, Description 1"
puts project1.add_to_team
