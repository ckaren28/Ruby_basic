
class SolarSystem
	attr_accessor :name, :planets
	def initialize(name="Solar System")
		@name = name
		@planets = ["Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune"]
	end

	def planets_count
		@planets.count
	end

	def super_nova
		@planets.clear
	end
end

class Planet < SolarSystem
	attr_accessor :description, :population

	def add_planets=(planet)
		@planets.push(planet)
	end
end
