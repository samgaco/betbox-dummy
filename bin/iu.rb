class UserInterface

    def initialize(schedule)

        @schedule = schedule


    end

    def schedule
        
        puts "Open boxing matches..."

        puts "Next boxing matches..."

    end


end


betbox = UserInterface.new("schedule")
betbox.schedule
