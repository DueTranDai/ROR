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

Role.where(:code => nil).destroy_all
unless Role.any?
  Role.create(:name => 'System Admin', :code => 'system_admin')
  Role.create(:name => 'Admin', :code => 'admin')
  Role.create(:name => 'Technician', :code => 'technician')
  Role.create(:name => 'Supervisor', :code => 'supervisor')
  Role.create(:name => 'Engineer', :code => 'engineer')
  Role.create(:name => 'Facility Manager', :code => 'facility_manager')
  Role.create(:name => 'Ops Manager', :code => 'ops_manager')
end
