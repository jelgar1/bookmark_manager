feature 'sign up' do
  scenario 'confirm user email' do
    visit ('/signup')
    fill_in 'email', with: 'charlieperson@gmail.com'
    fill_in 'password', with: '2001'
    click_button('Sign up')
    charlie = User.first
    expect(charlie.email).to include('charlieperson@gmail.com')
  end
end
