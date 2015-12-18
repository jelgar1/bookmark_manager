feature 'sign up' do
  scenario 'display welcome message upon sign up' do
    visit ('/signup')
    fill_in 'email', with: 'charlieperson@gmail.com'
    fill_in 'password', with: '2001'
    click_button('Sign up')
    expect(page).to have_content 'Welcome charlieperson@gmail.com'
  end
end
