require 'chit'

describe Chit do
    let(:chit_1) { Chit.new(text: 'The first Chit') }
        describe '.text' do
            it 'Shows the text of a given Chit' do
                chit_1 = Chit.new(text: 'The first Chit')
                expect(chit_1.text).to eq 'The first Chit'
            end
        end
        describe '.all' do
            it 'returns a list of chits' do
              chits = Chit.all
          
              expect(chits).to include "The first chit"
              expect(chits).to include "The second chit"
              expect(chits).to include "The third chit"
            end
          end
          
end

