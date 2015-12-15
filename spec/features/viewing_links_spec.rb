feature 'viewing a list' do
  scenario 'viewing bookmarks returns a list of links' do

    Bookmark.create(url: 'www.link1.com', title: 'link1')

    visit ('/links')

    within 'ul#links' do
      expect(page).to have_content 'link1'
    end
  end
end
