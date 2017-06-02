feature 'creating links' do
  scenario 'users can add tag to link' do
    visit('/links/new')
    fill_in('name', :with => 'Google')
    fill_in('address', :with => 'www.google.com')
    fill_in('tag', :with => 'search')
    click_button('Add Link')
    link = Link.first
    expect(link.tags.map(&:name)).to include('search')
  end

  scenario 'users can add multiple tags to link' do
    visit('/links/new')
    fill_in('name', :with => 'Reddit')
    fill_in('address', :with => 'www.reddit.com')
    fill_in('tag', :with => 'news social')
    click_button('Add Link')
    link = Link.first
    expect(link.tags.map(&:name)).to include('news', 'social')
  end
end
