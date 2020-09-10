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

pp order1 = user.orders.create!(date: date, status: status)
pp order1.add_food(food11)
pp order1.add_food(food21)
pp order1.add_food(food31)

pp order2 = other_user.orders.create!(date: date, status: status)
pp order2.add_food(food11)
pp order2.add_food(food22)
pp order2.add_food(food32)

pp order3 = user.orders.create!(date: last_date, status: status)
pp order3.add_food(last_food12)
pp order3.add_food(last_food22)
pp order3.add_food(last_food31)

pp order4 = other_user.orders.create!(date: last_date, status: status)
pp order4.add_food(last_food11)
pp order4.add_food(last_food21)
pp order4.add_food(last_food32)
