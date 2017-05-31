feature 'Homepage' do
  scenario 'See list of links bookmarked on the homepage' do
    Link.create(name: "Makers Academy", address: "https://www.makersacademy.com")
    visit('/links')
    expect(page.status_code).to eq 200
    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end
end
