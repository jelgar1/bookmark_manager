feature 'creating a tag' do
  scenario 'so a user can associate a tag with a link' do
    visit 'links/new'
    fill_in 'title', with: 'link2'
    fill_in 'url', with: 'www.internet.com'
    fill_in 'tags', with: 'online'
    click_button 'Create bookmark'
    link = Link.first
    expect(link.tags.map(&:name)).to include 'online'
  end
end
