require 'rails_helper'

feature 'First sign up is admin user', '
  As a first registered user in the system,
  I became a Lunches Admin
' do
  given(:users) { create_list(:user, 2) }

  scenario 'First registered user in the system is Admin' do
    sign_in(users.first)

    expect(page).to have_content 'Admin'
  end

  scenario 'Not first registered user in the system is not Admin' do
    sign_in(users.last)

    expect(page).to_not have_content 'Admin'
  end
end
