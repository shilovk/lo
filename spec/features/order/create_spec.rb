require 'rails_helper'

feature 'User can create order', '
  In order to get food
  As an authenticated user
  I\'d like to be able to create order
' do
  given!(:admin) { create(:user) }
  given!(:user) { create(:user) }
  given(:day) { Time.current.strftime("%A") }
  given(:weak_days) { Food.weak_days }
  given(:weak_dates) { Food.weak_dates }
  given!(:first_foods) { create_list(:food, 2, :first) }
  given!(:main_foods) { create_list(:food, 2, :main) }
  given!(:drink_foods) { create_list(:food, 2, :drink) }

  scenario 'Authenticated admin user can see only admin\'s dashboard' do
    sign_in(admin)

    expect(page).to have_css '.admin_dashboard'
    expect(page).to_not have_css '.user_dashboard'
  end

  scenario 'Unauthenticated user can not see any dashboards' do
    visit root_path

    expect(page).to_not have_css '.admin_dashboard'
    expect(page).to_not have_css '.user_dashboard'
  end

  describe 'Authenticated user' do
    background { sign_in(user) }

    scenario 'can see only user\'s dashboard' do
      expect(page).to have_css '.user_dashboard'
      expect(page).to_not have_css '.admin_dashboard'
    end

    scenario 'can see forming order' do
      expect(page).to have_content 'Order'
    end

    describe 'create order', js: true do
      scenario 'add first food to order' do
        click_on day
        within ".nav-item.dropdown.#{day}.show" do
          click_on first_foods.first.title
        end

        within '.order' do
          expect(page).to have_content first_foods.first.title
        end
      end

      scenario 'add main food to order' do
        click_on day
        within ".nav-item.dropdown.#{day}.show" do
          click_on main_foods.first.title
        end

        within '.order' do
          expect(page).to have_content main_foods.first.title
        end
      end

      scenario 'add drink to order' do
        click_on day
        within ".nav-item.dropdown.#{day}.show" do
          click_on drink_foods.first.title
        end

        within '.order' do
          expect(page).to have_content drink_foods.first.title
        end
      end

      scenario 'process order' do
        click_on 'Process order'

        expect(page).to have_content 'processing'
      end
    end
  end
end
