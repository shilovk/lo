require 'rails_helper'

feature 'Authenticated admin user can see users\' orders', '
  In order to see all orders by days
  As an Authenticatedadmin user
  I\'d like to be able to browse days and see users’ orders
' do
  given!(:admin) { create(:user, :admin) }
  given!(:user) { create(:user) }
  given!(:other_user) { create(:user) }
  given!(:date) { Time.current.to_date }
  given!(:last_date) { date - 1.day }
  given!(:order) { create(:order, :performed, user: user, date: date) }
  given!(:other_order) { create(:order, :performed, user: other_user, date: date) }
  given!(:last_order) { create(:order, :performed, user: user, date: last_date) }
  given!(:other_last_order) { create(:order, :performed, user: other_user, date: last_date) }

  describe 'Authenticated admin user can see users\' orders' do
    background do
      sign_in(admin)
      click_on class: 'list-orders-link'
    end

    scenario 'on today' do
      click_on class: 'prev-orders-link'
      click_on class: 'next-orders-link'

      [order, other_order].each do |order|
        expect(page).to have_css ".order-#{order.id}"
      end

      [last_order, other_last_order].each do |order|
        expect(page).to_not have_css ".order-#{order.id}"
      end
    end

    scenario 'on last date' do
      click_on class: 'prev-orders-link'

      [last_order, other_last_order].each do |order|
        expect(page).to have_css ".order-#{order.id}"
      end

      [order, other_order].each do |order|
        expect(page).to_not have_css ".order-#{order.id}"
      end
    end

    scenario 'with total price' do
      [order, other_order].each do |order|
        within ".order-total-price-#{order.id}" do
          expect(page).to have_content order.total_price
        end
      end
    end

    scenario 'with total cost for today' do
      total_cost = order.total_price + other_order.total_price

      within '.orders-total-cost' do
        expect(page).to have_content total_cost
      end
    end
  end

  scenario 'Authenticated user can not see orders' do
    sign_in(user)

    expect(page).to have_link class: 'list-orders-link'
  end

  scenario 'Unauthenticated user can not see users\' orders' do
    visit root_path

    expect(page).to_not have_link class: 'list-orders-link'
  end
end
