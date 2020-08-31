require 'rails_helper'

feature 'User can sign out', '
  In order to sign out
  As an authenticated user
  I\'d like to be able to sign out
' do
  given(:user) { create(:user) }

  scenario 'Registered user сan to sign out' do
    sign_in(user)
    click_on 'Sign out'

    expect(page).to_not have_link 'Sign out'
  end
end
