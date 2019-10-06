feature 'Updating a chit' do
  scenario 'A user can update a chit' do
    sign_up
    add_one_chit
    # editing bookmark stage
    click_button 'Edit'
    fill_in('text', with: "Test Chit 2")
    click_button('Submit')

    expect(current_path).to eq '/chits'
    expect(page).not_to have_content('Test Chit 1')
    expect(page).to have_content('Test Chit 2')
  end
end