feature 'filtering by tag' do

  before(:each) do
    Link.create(name: 'Bubbledogs', address: 'www.bubbledogs.co.uk', tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(name: 'Bubble Baths', address: 'www.bubblesbathrooms.co.uk', tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(name: 'Google', address: 'www.google.com', tags: [Tag.first_or_create(name: 'search')])
    Link.create(name: 'Facebook', address: 'www.facebook.com', tags: [Tag.first_or_create(name: 'social')])
  end

  scenario 'users can filter links by tag' do 
    visit('/tags/bubbles')
    within 'ul#links' do
      expect(page).to have_content('Bubbledogs')
      expect(page).to have_content('Bubble Baths')
      expect(page).to_not have_content('Google')
      expect(page).to_not have_content('Facebook')
    end
  end

end
