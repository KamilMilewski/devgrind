require 'rails_helper'
feature 'User visits home page', js: true do
  let!(:user) do
    create(:user,
           email: 'factory@girl.user',
           password: 'password',
           password_confirmation: 'password')
  end

  context 'as a guest' do
    before { visit root_path }

    it 'logs in successfully' do
      expect(page).to have_content 'Log in'
      fill_in 'Email', with: 'factory@girl.user'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      expect(page).to have_link 'Log out'
    end

    it 'tries to logs in and fails miserably' do
      fill_in 'Email', with: 'no such email in db'
      fill_in 'Password', with: 'som wrong password'
      click_button 'Log in'
      expect(page).to_not have_link 'Log out'
      expect(page).to have_content 'Invalid Email or password.'
    end
  end

  context 'as a logged in' do
    before do
      sign_in user
      visit root_path
    end

    it 'logs out successfully' do
      click_link 'Log out'
      expect(page).to_not have_link 'Log out'
      expect(page).to have_button 'Log in'
    end
  end
end
