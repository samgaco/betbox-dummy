class Scorer

    def initialize(schedule)
        @schedule = schedule
    end 

    def offer_match_from_open 

        open_bm_array = @schedule.return_open_boxing_matches
        print "Select which match do you want to score: \n"
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
        return  @schedule.open_bm_hash[match_number]
    end

    def round_remaining_time
        puts "The round will finish in..."
        0.downto(0) do |i|
            puts "00:00:#{'%02d' % i}"
            sleep 1
          end
    end

    def score_match(bm, round_counter)
        puts "Scoring round number " + round_counter.to_s
        round_remaining_time
        print bm.fighter1 + " gets...\n"
        f1_points = gets.chomp().to_i
        while f1_points < 7 || f1_points > 10
            print bm.fighter1 + "...insert a number between 7 and 10\n"
            f1_points = gets.chomp().to_i
        end
        print bm.fighter2 + " gets...\n"
        f2_points = gets.chomp().to_i
        while f1_points < 7 || f1_points > 10
            print bm.fighter1 + "...insert a number between 7 and 10\n"
            f1_points = gets.chomp().to_i
        end
        bm.rounds[round_counter].fighter1_scored = f1_points
        bm.rounds[round_counter].fighter2_scored = f2_points
    end


end