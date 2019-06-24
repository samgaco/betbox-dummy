require_relative '../lib/boxing_match.rb'
require_relative '../lib/user.rb'
require_relative '../lib/schedule.rb'
require_relative '../lib/scorer.rb'


class UserInterface

    def initialize(schedule)
        @schedule = schedule
        @scorer = Scorer.new(schedule)
        schedule_open
        @scorer.offer_match_from_open 
        @selected_match = @scorer.select_match_from_open 
        number_rounds_to_score
        @current_match_obj = @schedule.dic_bms[@selected_match]
        #print @current_match_obj.rounds[1].fighter1 => prints tyson fury
        round_counter = 1
        @current_match_obj.num_rounds.times do 
            if @scorer.is_ko?(@current_match_obj) == 2
                @scorer.score_match(@current_match_obj, round_counter)
                round_counter += 1
            else 
                if @current_match_obj.winner = @current_match_obj.fighter1
                    @scorer.write_in_file(@current_match_obj, round_counter, 'WON', 'LOST')
                else 
                    @scorer.write_in_file(@current_match_obj, round_counter, 'LOST', 'WON')
                end
                break
            end
        end

    end

    def schedule_open    
        puts "\nOpen boxing matches...\n"
        @schedule.open_matches_now?
    end

    def schedule_next
        puts "\nNext boxing matches...\n"
        puts @schedule.calendar
    end

    def number_rounds_to_score
        w_class= @schedule.dic_bms[@selected_match].weight_class
        n_rounds = @schedule.dic_bms[@selected_match].num_rounds.to_s
        puts  'This ' + w_class + ' bout has ' +  n_rounds + " rounds"
    end

end

#example

sched = Schedule.new

bm = BoxingMatch.new('Tyson Fury', 'Tom Schwarz', 'Heavyweight', Date.today.to_s)
bm_2 = BoxingMatch.new('Dorticos', 'Tabiti', 'Heavyweight', Date.today.to_s)
bm_3 = BoxingMatch.new('Warrington', 'Galahad', 'Heavyweight', Date.today.to_s)
bm_4 = BoxingMatch.new('Briedis', 'Glowacki', 'Heavyweight', Date.today.to_s)
bm_5 = BoxingMatch.new('Harrison', 'Jermel Charlo', 'Heavyweight', Date.today.to_s)


sched.add_boxing_match(bm)
sched.add_boxing_match(bm_2)
sched.add_boxing_match(bm_3)
sched.add_boxing_match(bm_4)
sched.add_boxing_match(bm_5)


betbox = UserInterface.new(sched)
