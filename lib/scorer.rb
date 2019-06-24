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
            puts "00:#{'%02d' % i}"
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
        while f2_points < 7 || f2_points > 10 
            print bm.fighter2 + "...insert a number between 7 and 10\n"
            f2_points = gets.chomp().to_i
        end
        bm.rounds[round_counter].fighter1_scored = f1_points
        bm.rounds[round_counter].fighter2_scored = f2_points

        write_in_file(bm, round_counter, f1_points, f2_points)
    end

    def is_ko?(bm)
        puts 'someone got KOed? 
        1) Yes
        2) No'
        isko = gets.chomp().to_i
        while isko < 1 || isko > 2
            print bm.fighter1 + "...choose 1 or 2\n"
            isko = gets.chomp().to_i
        end
        if isko == 1
            puts 'who won?'
            puts '1)' + bm.fighter1
            puts '2)' + bm.fighter2
            winner = gets.chomp().to_i
            while isko < 1 || isko > 2
                puts 'who won?'
                puts '1)' + bm.fighter1
                puts '2)' + bm.fighter2
                winner = gets.chomp().to_i
            end
            winner == 1? bm.winner = bm.fighter1 : bm.winner = bm.fighter2
            return isko
        else
            return isko
        end
    end

    def write_in_file(bm, round_counter, f1_points, f2_points)
        bm_name = bm.fighter1.to_s + "_vs_" + bm.fighter2.to_s
        file = File.open('../data/scoring_'+ bm_name +'.txt', 'w') if round_counter == 1
        file = File.open('../data/scoring_'+ bm_name +'.txt', 'a') if round_counter != 1
        file.puts bm.fighter1 + "," + bm.fighter2 if round_counter == 1
        lines = f1_points.to_s + "," + f2_points.to_s
        file.puts lines
        file.close
    end


end