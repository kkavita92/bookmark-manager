feature 'sign up system for multiple users' do
  scenario 'user can sign in and see his/her links' do
    sign_in
    expect { sign_in }.to change(User, :count).by(1)
    expect(page).to have_content 'Welcome, kkavita92@gmail.com!'
  end

  scenario 'no users created when wrong password input' do
    expect { incorrect_sign_in }.not_to change(User, :count)
  end
end
