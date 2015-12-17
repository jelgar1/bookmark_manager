
feature 'creating multiple tags' do
  scenario 'allowing a user to associate multiple tags with a link' do
  visit 'links/new'
  fill_in 'title', with: 'Clash Of Clans'
  fill_in 'url', with: 'www.clashofclans.com'
  fill_in 'tags', with: 'games, mobile'
  click_button 'Create bookmark'
  link = Link.first
  expect(link.tags.map(&:name)).to include('games', 'mobile')
end

end
