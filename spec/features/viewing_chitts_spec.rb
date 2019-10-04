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

    scenario 'Visiting /chits shows me all the chits' do
        connection = PG.connect(dbname: 'chitter_test')

        # Add the test data
        connection.exec("INSERT INTO chits (text) VALUES ('The first chit');")
        connection.exec("INSERT INTO chits (text) VALUES ('The second chit');")
        connection.exec("INSERT INTO chits (text) VALUES ('The third chit');")
        Chit.create(text: "The first chit")
        Chit.create(text: "The second chit")
        Chit.create(text: "The third chit")
        
        visit('/chits')

        expect(page).to have_content "The first chit"
        expect(page).to have_content "The second chit"
        expect(page).to have_content "The third chit"
    end

    scenario 'chits are visible' do
        Chit.create(text: 'The first test chit')
        Chit.create(text: 'The second test chit')
        Chit.create(text: 'The third test chit')
    
        visit '/chits'
    
        expect(page).to have_content('The first test chit')
        expect(page).to have_content('The second test chit')
        expect(page).to have_content('The third test chit')
    end




  end