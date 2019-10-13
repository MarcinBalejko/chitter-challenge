feature 'Deleting a chit' do
  scenario 'A user can delete a chit' do
    sign_up
    add_one_chit
    visit('chits/my')
    click_button 'Delete'

    expect(current_path).to eq '/chits'
    expect(page).not_to have_content('Test Chit 1')
  end
end