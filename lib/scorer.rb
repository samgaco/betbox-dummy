class Scorer

    def initialize(schedule)
        @schedule = schedule
    end 

    def offer_match_from_open 

        open_bm_array = @schedule.return_open_boxing_matches
        print "Select which match do you want to score: "
        for i in open_bm_array
            puts "\n"
            puts i    
        end 

    end

    def select_match_from_open
        puts "Enter the number of the match you want to select: "
        match_number = gets.chomp().to_i
        puts "You selected: ",  @schedule.open_bm_hash[match_number]
        puts "\n"


    end

    def score_this_round


    end


end