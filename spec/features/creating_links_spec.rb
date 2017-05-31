feature 'adding new links to bookmark manager' do
  scenario 'add a site address and title' do
    visit('/links/new')
    fill_in('name', :with => 'Weasels for sale')
    fill_in('address', :with => 'https://www.youtube.com/watch?v=oHg5SJYRHA0')
    click_button('Add Link')
    within 'ul#links' do
      expect(page).to have_content 'Name: Weasels for sale'
    end
  end
end
