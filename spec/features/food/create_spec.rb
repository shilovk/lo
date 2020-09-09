require 'rails_helper'

feature 'Admin can create food', '
  In order to create food
  As an authenticated admin user
  I\'d like to be able to create it only for today
' do
  given!(:admin) { create(:user) }
  given!(:user) { create(:user) }

  scenario 'Authenticated user can not create food' do
    sign_in(user)

    expect(page).to_not have_css '.add-food-link'
  end

  scenario 'Unauthenticated user can not create food' do
    visit root_path

    expect(page).to_not have_css '.add-food-link'
  end

  describe 'Authenticated admin' do
    given(:today) { Time.current.to_date }
    given(:prev_date) { today - 1.day }
    given(:next_date) { today + 1.day }

    background { sign_in(admin) }

    scenario 'can see new link food' do
      expect(page).to have_css '.new-food-link'
    end

    scenario 'creates food' do
      click_on class: 'new-food-link'

      fill_in 'Title', with: 'Test title'
      fill_in 'Price', with: 10
      attach_file 'Image', Rails.root.join('app', 'javascript', 'images', 'rails.jpg')

      click_on class: 'save-button-link'

      expect(page).to have_content 'Food was successfuly created.'
    end

    scenario 'creates food only for today' do
      click_on class: 'new-food-link'

      within 'form' do
        expect(page).to have_content today
        expect(page).to_not have_content prev_date
        expect(page).to_not have_content next_date
      end
    end
  end
end
