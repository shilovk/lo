pp User.create(name: 'admin', email: 'admin@admin.com', password: '123456')
pp user = User.create(name: 'user', email: 'user@user.com', password: '123456')
pp other_user = User.create(name: 'other_user', email: 'other_user@user.com', password: '123456')

pp date = Time.current.to_date
pp last_date = date - 1.day

pp food11 = Food.create!(title: 'Lenten soup', price: 10, date: date, category: 1)
pp food12 = Food.create!(title: 'Pea soup', price: 15, date: date, category: 1)
pp food21 = Food.create!(title: 'Meat cake', price: 30, date: date, category: 2)
pp food22 = Food.create!(title: 'Vanilla cake', price: 20, date: date, category: 2)
pp food31 = Food.create!(title: 'Tea', price: 5, date: date, category: 3)
pp food32 = Food.create!(title: 'Coffee', price: 10, date: date, category: 3)

pp last_food11 = Food.create!(title: 'Lenten soup last', price: 10, date: last_date, category: 1)
pp last_food12 = Food.create!(title: 'Pea soup last', price: 15, date: last_date, category: 1)
pp last_food21 = Food.create!(title: 'Meat cake last', price: 30, date: last_date, category: 2)
pp last_food22 = Food.create!(title: 'Vanilla cake last', price: 20, date: last_date, category: 2)
pp last_food31 = Food.create!(title: 'Tea last', price: 5, date: last_date, category: 3)
pp last_food32 = Food.create!(title: 'Coffee last', price: 10, date: last_date, category: 3)

pp status = Order::STATUSES.last

pp user.orders.create(date: date, status: status, foods: [food11, food21, food31])
pp other_user.orders.create(date: date, status: status, foods: [food11, food22, food32])

pp user.orders.create(date: last_date, status: status, foods: [last_food12, last_food22, last_food31])
pp other_user.orders.create(date: last_date, status: status, foods: [last_food11, last_food22, last_food32])
