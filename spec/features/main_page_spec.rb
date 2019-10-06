feature 'Enter the main page' do
    scenario 'User can enter the main page' do
        visit('/')
        expect(page).to have_content('Chitter')
    end
end