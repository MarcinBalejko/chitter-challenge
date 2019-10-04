feature 'Viewing bookmarks' do
    scenario 'A user can see chits' do
      visit('/chitts')
  
      expect(page).to have_content "The first chit"
      expect(page).to have_content "The second chit"
      expect(page).to have_content "The third chit"
    end
  end