require 'time'

class TimeCalculator
    def self.show_time
        Time.now.strftime("%d/%m/%Y %H:%M")
    end
end