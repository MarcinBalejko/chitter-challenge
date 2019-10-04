feature 'Adding a new chit' do
    scenario 'A user can add a chit to Chitter' do
      visit('/chits/new')
      fill_in('text', with: 'The first chit')
      click_button('Submit')
  
      expect(page).to have_content 'The first chit'
    end
  end