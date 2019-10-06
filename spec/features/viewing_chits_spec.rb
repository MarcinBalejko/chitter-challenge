require 'pg'

feature 'Viewing chits' do
  feature 'visiting the homepage' do
    scenario 'the page title is visible' do
      visit '/'
      expect(page).to have_content 'Chitter'
    end
  end
  feature 'viewing chits' do
    let(:user) { User.create(email: 'user@gmail.com', password: 'testpassword') }
    scenario 'chits are visible' do
      sign_up
      add_three_chits
  
      expect(page).to have_content('Test Chit 1')
      expect(page).to have_content('Test Chit 2')
      expect(page).to have_content('Test Chit 3')
    end
  end
end