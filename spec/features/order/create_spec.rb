require 'rails_helper'

feature 'User can create order', '
  In order to get food
  As an authenticated user
  I\'d like to be able to create order
' do
  given(:user) { create(:user) }
  given(:day) { Time.current.strftime("%A") }
  given(:weak_days) { Food.weak_days }
  given(:weak_dates) { Food.weak_dates }
  given!(:first_foods) { create_list(:food, 2, :first) }
  given!(:main_foods) { create_list(:food, 2, :main) }
  given!(:drinks_foods) { create_list(:food, 2, :drink) }

  background { sign_in(user) }

  describe 'Authenticated user' do
    scenario 'can see actual order' do
      expect(page).to have_content 'Order'
      expect(page).to have_link 'Create Order'
    end

    describe 'create order', js: true do
      scenario 'add food to order' do
        click_on day
        within ".nav-item.dropdown.#{day}.show" do
          click_on first_foods.first.title
        end
      end
    end
  end
end
