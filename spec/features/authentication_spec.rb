feature 'Authentication' do
  scenario 'a user can sign in' do
    User.create(email: 'test@example.com', password: 'password123', name: 'User')

    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).to have_button 'Add Chit'
  end
  scenario 'a user sees an error if they get their email wrong' do
    User.create(email: 'test@example.com', password: 'password123', name: 'User')

    visit '/sessions/new'
    fill_in(:email, with: 'nottherightemail@me.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')

    expect(page).not_to have_content '~ SAYS:'
    expect(page).to have_content 'Please check your email or password.'
  end
  scenario 'a user sees an error if they get their password wrong' do
    User.create(email: 'test@example.com', password: 'password123', name: 'User')

    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'wrongpassword')
    click_button('Sign in')

    expect(page).not_to have_content '~ SAYS:'
    expect(page).to have_content 'Please check your email or password.'
  end
  scenario 'a user can sign out' do
    User.create(email: 'test@example.com', password: 'password123', name: 'User')

    visit '/sessions/new'
    fill_in(:email, with: 'test@example.com')
    fill_in(:password, with: 'password123')
    click_button('Sign in')
    click_button('Sign Out')

    expect(current_path).to eq '/'
  end


end