require 'pg'

feature 'Viewing bookmarks' do
    scenario 'A user can see chits' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO chits VALUES(1, 'The first chit');")
      connection.exec("INSERT INTO chits VALUES(2, 'The second chit');")
      connection.exec("INSERT INTO chits VALUES(3, 'The third chit');")

      visit('/chits')
  
      expect(page).to have_content "The first chit"
      expect(page).to have_content "The second chit"
      expect(page).to have_content "The third chit"
    end
  end