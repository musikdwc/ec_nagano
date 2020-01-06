# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Examples:

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# Character.create(name: 'Luke', movie: movies.first)
Customer.create(email: 'test1@test.com', password: '111111')
Customer.create(email: 'test2@test.com', password: '222222')
Customer.create(email: 'test3@test.com', password: '333333')
Customer.create(email: 'test4@test.com', password: '444444')

Admin.create!(
    {
      email: 'admin1@test.com',
      password: '111111'
    }
)



Tax.create(tax: 1.1)