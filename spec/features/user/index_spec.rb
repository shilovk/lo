require 'rails_helper'

feature 'Authenticated admin user can see list of users', '
  In order to see all users
  As an Authenticatedadmin user
  I\'d like to be able to see list of users
' do
  given!(:admin) { create(:user, :admin) }
  given!(:user) { create(:user) }
  given!(:users) { create_list(:user, 3) }

  scenario 'Authenticated user can not see list of users' do
    sign_in(user)

    expect(page).to_not have_link class: 'list-users-link'
  end

  scenario 'Unauthenticated user can not see list of users' do
    visit root_path

    expect(page).to_not have_link class: 'list-users-link'
  end

  scenario 'Authenticated admin user can see list of users' do
    sign_in(admin)

    click_on class: 'list-users-link'

    users.each do |user|
      expect(page).to have_content user.email
      expect(page).to have_content user.name
    end
  end
end
