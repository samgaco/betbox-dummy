require 'date'

class Schedule

    attr_reader :calendar

    def initialize
        @calendar = []
        @dates_bm = {}
        @open_bm = []
    end

    def add_boxing_match(bm)

        #this should add the data of the boxing match to a database
        
        @calendar << [bm.fighter1 + " " +  bm.fighter2 + " " + bm.date]
        @dates_bm[bm.date] = bm.fighter1 + " vs " + bm.fighter2

    end


    def open_matches_now?
        i = 0
        @dates_bm.each do |key, value|
            if key == Date.today.to_s
                print value
                i += 1
            end

            if i == 0
                print 'No matches now'
                print key
            end 
        end

    end


end