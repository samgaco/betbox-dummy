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
        

    end

    def schedule_open    
        puts "\nOpen boxing matches..."
        @schedule.open_matches_now?
    end

    def schedule_next
        puts "\nNext boxing matches..."
        puts @schedule.calendar
    end

    def number_rounds_to_score
        w_class= @schedule.dic_bms[@selected_match].weight_class
        n_rounds = @schedule.dic_bms[@selected_match].num_rounds.to_s
        puts  'This ' + w_class + ' bout has ' +  n_rounds + " rounds"
    end

end

sched = Schedule.new
bm = BoxingMatch.new('Tyson Fury', 'Tom Schwarz', 'Heavyweight', Date.today.to_s)
bm_2 = BoxingMatch.new('Example fighter1', 'Example fighter2', 'Heavyweight', Date.today.to_s)


sched.add_boxing_match(bm)
sched.add_boxing_match(bm_2)

betbox = UserInterface.new(sched)
