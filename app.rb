require 'pry'



class Building
    attr_accessor :name, :numberTenants
    attr_reader :address, :numberFloors

    @@all = []

    def initialize (name, address, numberFloors, numberTenants)
        @name = name
        @address = address
        @numberFloors = numberFloors
        @numberTenants = numberTenants #average number of tenants
        @@all << self
    end

    def self.all
        @@all
    end
        
    #"The class should tell the average number of tenants in a building"
    def self.average_tenants_throughout_all_building
        totalTenants = self.all.reduce(0) do |sum, building|
            sum + building.numberTenants
        end
        totalTenants.to_f / self.all.length
    end

    #"* A building should have a placard method that returns the name and address of the building"
    def self.placard (building_name)
        self.all.select do |building|
            building.name == building_name
            return "#{building.name}, #{building.address}"
        end
    end

    #* A building should have a method returns the average number of tenants per floor"
    def self.average_tenants_per_floor (userBuilding)
        self.all.select do |building|
            building.name == userBuilding.name
        end.map do |building|
           # binding.pry
            sum = building.numberTenants.to_f / building.numberFloors.to_f
        end
    end

end

#"Make objects for the three buildings on this corner. Use a Fermi estimate for the number of tenants."
the_hub = Building.new("The Hub", "12345 Walnut St", 7, 3000)
neo_studio = Building.new("Neo Studio", "3560 Walnut St", 2, 100)
learning_center = Building.new("Where Dreams Begin Learning Center", "3739 N Downing St", 1, 75)
abandoned_building = Building.new("abandoned building...", "3563 Walnut St", 1, 0)

#test