def sign_up
    visit('/')
      click_button 'Sign up'
      fill_in('email', with: 'user@gmail.com')
      fill_in('password', with: 'testpassword')
      click_button 'Submit'
end

def add_one_chit
    click_button 'Add Chit'
    fill_in('text', with: 'Test Chit')
    click_button('Submit')
end

def add_three_bookmarks
     click_button 'Add Bookmark'
     fill_in('text', with: 'Test Chit 1')
     click_button('Submit')

     click_button 'Add Bookmark'
     fill_in('text', with: 'Test Chit 2')
     click_button('Submit')

     click_button 'Add Bookmark'
     fill_in('text', with: 'Test Chit 3')
     click_button('Submit')
end