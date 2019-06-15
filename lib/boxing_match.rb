class BoxingMatch

    attr_reader :fighter1, :fighter2, :date
    
    def initialize(fighter1, fighter2, weight_class, date, titles = 0, num_rounds=12)

        @num_rounds = num_rounds
        @fighter1 = fighter1
        @fighter2 = fighter2
        @weight_class = weight_class
        @date = date
        @titles = titles

    end






end