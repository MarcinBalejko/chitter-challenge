require 'chit'
require 'database_helpers'

describe Chit do
    
        describe '.text' do
            it 'Shows the text of a given Chit' do
                chit = Chit.new(text: 'The first Chit')
                expect(chit.text).to eq 'The first Chit'
            end
        end
        describe '.all' do
            it 'returns a list of bookmarks' do
              connection = PG.connect(dbname: 'chitter_test')
           
              # Add the test data
              chit = Chit.create(text: "The first test chit")
              Chit.create(text: "The second test chit")
              Chit.create(text: "The third test chit")
           
              chits = Chit.all
           
              expect(chits.length).to eq 3
              #expect(chits.first).to be_a Chit
              expect(chits.first.id).to eq chit.first['id']
              expect(chits.first.text).to eq 'The first test chit'
            end
        end

        describe '.create' do
            it 'creates a new bookmark' do
                chit = Chit.create(text: 'Test chit')
                persisted_data = persisted_data(id: chit.id)

                expect(chit).to be_a Chit
                expect(chit.id).to eq persisted_data.first['id']
                expect(chit.text).to eq 'Test chit'
            end
        end
        
end

