class Player
    attr_reader :name, :points
 
    def initialize(name)
        @name = name
        @points = 0
    end

    def won_point
        @points +=1
    end
end