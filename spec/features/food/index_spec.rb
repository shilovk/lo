require 'rails_helper'

feature 'User can see food', '
  In order to get food on actual day
  As an authenticated
  I\'d like to be able to see it list
' do
  given(:user) { create(:user) }
  given(:weak_days) { Food.weak_days }
  given(:weak_dates) { Food.weak_dates }
  given!(:foods) { create_list(:food, 2) }

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

  scenario 'Unauthenticated user can not view days list' do
    visit root_path

    weak_days.each do |day|
      expect(page).to_not have_content day
    end
  end
end
