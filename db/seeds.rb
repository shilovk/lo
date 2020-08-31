pp User.create(name: 'admin', email: 'admin@admin.com', password: '123456')
pp User.create(name: 'user', email: 'user@user.com', password: '123456')

pp date = Time.current.to_date

pp Food.create!(title: 'Lenten soup', price: 10, date: date, category: 1)
pp Food.create!(title: 'Pea soup', price: 15, date: date, category: 1)

pp Food.create!(title: 'Meat cake', price: 30, date: date, category: 2)
pp Food.create!(title: 'Vanilla cake', price: 20, date: date, category: 2)

pp Food.create!(title: 'Tea', price: 5, date: date, category: 3)
pp Food.create!(title: 'Coffee', price: 10, date: date, category: 3)
