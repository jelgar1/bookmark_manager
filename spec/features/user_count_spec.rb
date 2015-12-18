feature 'sign up' do
  scenario 'user is given a count number on sign up' do
    visit ('/signup')
    fill_in 'email', with: 'charlieperson@gmail.com'
    fill_in 'password', with: '2001'
    click_button('Sign up')
    expect(User.all.length).to eq(1)
  end
end
