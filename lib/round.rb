class Round

    attr_reader :fighter1, :fighter2
    attr_accessor :fighter1_scored, :fighter2_scored

    def initialize(bm, i)
        @duration = 180
        @fighter1 = bm.fighter1
        @fighter2 = bm.fighter2
        @round_position = i

        @fighter1_scored = 0
        @fighter2_scored = 0
    end

    

end