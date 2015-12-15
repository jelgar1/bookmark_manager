feature 'creating a link' do
  scenario 'saving a website url and title to bookmarks' do
    visit '/links/new'
    fill_in 'title', with: 'link2'
    fill_in 'url', with: 'www.internet.com'
    click_button 'Create bookmark'

    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content("Title: link2 URL: www.internet.com")
    end
  end
end
