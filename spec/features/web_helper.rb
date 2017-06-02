def sign_in
  visit('/users/new')
  expect(page.status_code).to eq(200)
  fill_in('email', :with => 'kkavita92@gmail.com')
  fill_in('password', :with => 'makers')
  click_button('Login')
end
