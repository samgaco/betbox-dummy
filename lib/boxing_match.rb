require 'date'
require_relative '../lib/round.rb'

class BoxingMatch

    attr_reader :fighter1, :fighter2, :date, :num_rounds, :weight_class
    attr_accessor :started, :rounds, :winner

    def initialize(fighter1, fighter2, weight_class, date, titles = 0, num_rounds=12)
        @num_rounds = num_rounds
        @fighter1 = fighter1
        @fighter2 = fighter2
        @weight_class = weight_class
        @date = date
        @titles = titles
        started?
        @rounds = {}
        set_rounds
        @winner = nil
    end

    def started?
        Date.today.to_s ==  @date ? @started = 'YES': @started = 'NO'
    end

    def set_rounds
        i = 1
        @num_rounds.times do 
            @rounds[i] = Round.new(self, i)
            i += 1
        end
    end






end