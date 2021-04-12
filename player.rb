class Player
    attr_reader :name, :points

    RESULTS = %w[Love Fifteen Thirty Forty]

    def initialize(name)
        @name = name
        @points = 0
    end

    def won_point
        @points +=1
    end

    def results_text
        RESULTS[points]
    end
end