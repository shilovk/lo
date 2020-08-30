# frozen_string_literal: true

require 'rails_helper'

feature 'User can sign out', '
  In order to sign out
  As an authenticated user
  I\'d like to be able to sign out
' do
  given(:user) { create(:user) }
  background { visit new_user_session_path }

  scenario 'Registered user сan to sign out' do
    sign_in(user)
    click_on 'Sign out'

    expect(page).to have_content 'Signed out successfully.'
  end
end
