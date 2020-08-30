require 'rails_helper'

feature 'User can edit profile', '
  In order to edit a profile
  As an authenticated user
  I\'d like to be able to edit my own profile
' do
  given(:user) { create(:user) }

  scenario 'Unauthenticated user can not edit profile' do
    expect(page).to_not have_link 'Edit profile'
  end

  describe 'Authenticated user' do
    background do
      sign_in(user)
      visit edit_user_registration_path
    end

    scenario 'edits own profile' do
      fill_in 'Name', with: 'edited Name'
      fill_in 'Email', with: 'editedmail@test.com'
      fill_in 'Current password', with: '123456'
      click_on 'Update'

      expect(page).to have_content 'Your account has been updated successfully.'
      expect(page).to_not have_content user.email
      expect(page).to have_content 'editedmail@test.com'
    end

    scenario 'edits own profile with errors' do
      fill_in 'Email', with: ''
      click_on 'Update'

      expect(page).to have_content 'Email not to be blank'
    end
  end
end
