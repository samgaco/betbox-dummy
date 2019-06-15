require_relative '../lib/boxing_match.rb'
require_relative '../lib/user.rb'
require_relative '../lib/schedule.rb'

class UserInterface

    def initialize(schedule)

        @schedule = schedule


    end

    def schedule
        
        puts "\nOpen boxing matches..."
        @schedule.open_matches_now?
        

        puts "\nNext boxing matches..."
        puts @schedule.calendar


    end


end

sched = Schedule.new
bm = BoxingMatch.new('Tyson Fury', 'Tom Schwarz', 'Heavyweight', '2019-06-15')

sched.add_boxing_match(bm)

betbox = UserInterface.new(sched)
betbox.schedule
