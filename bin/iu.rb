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
        @scorer.select_match_from_open 
        

    end

    def schedule_open    
        puts "\nOpen boxing matches..."
        @schedule.open_matches_now?
    end

    def schedule_next
        puts "\nNext boxing matches..."
        puts @schedule.calendar
    end


end

sched = Schedule.new
bm = BoxingMatch.new('Tyson Fury', 'Tom Schwarz', 'Heavyweight', Date.today.to_s)
bm_2 = BoxingMatch.new('Example fighter1', 'Example fighter2', 'Heavyweight', Date.today.to_s)


sched.add_boxing_match(bm)
sched.add_boxing_match(bm_2)

betbox = UserInterface.new(sched)
