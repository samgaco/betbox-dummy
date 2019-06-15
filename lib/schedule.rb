require 'date'

class Schedule

    attr_reader :calendar, :open_bm_hash, :open_bm_array
    attr_accessor :dic_bms

    def initialize
        @calendar = []
        @dates_bm = {}
        @open_bm_hash = {}
        @open_bm_array = []
        @dic_bms = {}
    end

    def add_boxing_match(bm)

        #this should add the data of the boxing match to a database
        
        @calendar << [bm.fighter1 + " " +  bm.fighter2 + " " + bm.date]
        @dates_bm[bm.fighter1 + " vs " + bm.fighter2] = bm.date
        @dic_bms[bm.fighter1 + " vs " + bm.fighter2] = bm

    end

    def open_matches_now?
        i = 0
        @dates_bm.each do |key, value|
            if value == Date.today.to_s
                puts "\n"
                puts key
                puts "\n"
                i += 1
            end
        end
        print "No boxing matches open now" if i == 0
    end

    def return_open_boxing_matches
        @open_bm_hash = {}
        @open_bm_array = []
        i = 1
        @dates_bm.each do |key, value|
            if value == Date.today.to_s
            @open_bm_hash[i] = key 
            @open_bm_array << i.to_s + ") " + key
            i += 1
            end
        end
        return @open_bm_array
    end

end