feature 'creating links' do
  scenario 'users form to submit a new link' do
    visit('/links/new')
    fill_in('name', :with => 'Google')
    fill_in('address', :with => 'www.google.com')
    click_button('Add Link')
    link = Link.first
    expect(link.tags.map(&:name)).to include('search')
  end
end
