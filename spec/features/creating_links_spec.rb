feature 'adding new links to bookmark manager' do
  scenario 'add a site address and title' do
    visit('/links/new')
    fill_in('Name', :with => 'Weasels for sale')
    fill_in('Address', :with => 'https://www.youtube.com/watch?v=oHg5SJYRHA0')
    click_button('Add Link')
    expect(page).to have_content 'Name: Weasels for sale'
  end
end
