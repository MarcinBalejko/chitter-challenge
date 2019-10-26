feature 'entering my chits page' do
  scenario 'a user can enter the page with his chits' do
    sign_up
    add_one_chit
    click_button('MY CHITS')
    
    expect(page).to have_content "Test Chit 1"
  end
  scenario 'a user can go back from my chits page to the main page' do
    sign_up
    add_one_chit
    click_button('MY CHITS')
    click_button('BOARD')

    expect(current_path).to eq '/chits'
    expect(page).to have_content "Test Chit 1"
  end
end