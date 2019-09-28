feature 'Enter main page' do
    scenario 'User can view the main page' do
        visit('/')
        expect(page).to have_content('Chitter Challenge')
    end
end