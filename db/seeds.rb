# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if User.find_by(:email => 'admin@maildrop.cc').blank?
    User.create(:email => 'admin@maildrop.cc', :full_name => 'Admin', :password => '123456', :password_confirmation => '123456')
end
