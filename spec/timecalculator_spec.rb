require 'timecalculator'

describe TimeCalculator do
    describe '.show_time' do 
        it 'shows the time at which a user posted a message' do
            expect(TimeCalculator.show_time).to eq(Time.now.strftime("%d/%m/%Y %H:%M"))
        end
    end
end