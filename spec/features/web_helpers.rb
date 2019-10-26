def sign_up
    visit('/sessions/new')
    visit('/users/new')
      
      fill_in('name', with: 'User')
      fill_in('email', with: 'user@gmail.com')
      fill_in('password', with: 'testpassword')
      click_button 'Sign up'
end

def add_one_chit
    click_button 'ADD CHIT'
    fill_in('text', with: 'Test Chit 1')
    click_button('Submit')
end

def add_three_chits
     click_button 'ADD CHIT'
     fill_in('text', with: 'Test Chit 1')
     click_button('Submit')

     click_button 'ADD CHIT'
     fill_in('text', with: 'Test Chit 2')
     click_button('Submit')

     click_button 'ADD CHIT'
     fill_in('text', with: 'Test Chit 3')
     click_button('Submit')
end