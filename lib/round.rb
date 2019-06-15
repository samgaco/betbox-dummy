class Round

    attr_reader :fighter1, :fighter2

    def initialize(bm, i)
        @duration = 180
        @fighter1 = bm.fighter1
        @fighter2 = bm.fighter2
        @round_position = i
    end

    

end