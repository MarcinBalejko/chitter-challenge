feature 'Adding a new chit' do
  scenario 'A user can add a chit to Chitter' do
    sign_up
    add_one_chit

    expect(page).to have_content('Test Chit 1')
  end

end