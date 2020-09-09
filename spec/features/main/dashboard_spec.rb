require 'rails_helper'

feature 'User can see foods', '
  In order to get food on actual day
  As an authenticated
  I\'d like to be able to see it list
' do
  given!(:admin) { create(:user) }
  given!(:user) { create(:user) }
  given(:weak_days) { %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday] }
  given(:weak_dates) { (Time.current.to_date.beginning_of_week..Time.current.to_date.end_of_week).to_a }
  given!(:foods) { create_list(:food, 2) }

  scenario 'Authenticated admin user can see view days list' do
    sign_in(admin)

    weak_days.each do |day|
      expect(page).to have_content day
    end
  end

  scenario 'Unauthenticated user can not view days list' do
    visit root_path

    weak_days.each do |day|
      expect(page).to_not have_content day
    end
  end

  describe 'Authenticated user' do
    background { sign_in(user) }

    scenario 'views days list' do
      weak_days.each do |day|
        expect(page).to have_content day
      end
    end

    scenario 'views foods list with prices on today' do
      weak_days.each_with_index do |day, i|
        within ".nav-item.dropdown.#{day}" do
          Food.on_date(weak_dates[i]).each do |food|
            expect(page).to have_content food.title
            expect(page).to have_content food.price
          end
        end
      end
    end
  end
end
