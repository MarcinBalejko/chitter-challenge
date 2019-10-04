require 'chit'
require 'database_helpers'

describe Chit do
    let(:chit_1) { Chit.new(text: 'The first Chit') }
        describe '.text' do
            it 'Shows the text of a given Chit' do
                chit_1 = Chit.new(text: 'The first Chit')
                expect(chit_1.text).to eq 'The first Chit'
            end
        end
        describe '.all' do
            it 'returns a list of bookmarks' do
              connection = PG.connect(dbname: 'chitter_test')
          
              # Add the test data
              connection.exec("INSERT INTO chits (text) VALUES ('The first chit');")
              connection.exec("INSERT INTO chits (text) VALUES ('The second chit');")
              connection.exec("INSERT INTO chits (text) VALUES ('The third chit');")
          
              bookmarks = Chit.all
          
              expect(bookmarks).to include('The first chit')
              expect(bookmarks).to include('The second chit')
              expect(bookmarks).to include('The third chit')
            end
          end
          describe '.create' do
            it 'creates a new bookmark' do
              chit = Chit.create(text: 'The test chit').first
          
              expect(chit['text']).to eq 'The test chit'
            end
          end


end

