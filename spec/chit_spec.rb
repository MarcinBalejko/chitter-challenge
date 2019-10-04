require 'chit'

describe Chit do
    let(:chit_1) { Chit.new(title: 'The first Chit') }
        describe '.title' do
            it 'Shows the title of the Chit' do
                chit_1 = Chit.new(title: 'The first Chit')
                expect(chit_1.title).to eq 'The first Chit'
        end
    end
end

