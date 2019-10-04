feature 'Adding a new chit' do
    scenario 'A user can add a chit to Chitter' do
        visit('/chits/new')
        fill_in('text', with: 'Test chit')
        fill_in('text', with: 'Test chit')
        click_button('Submit')
        expect(page).to have_content('Test chit')
    end
 
  end