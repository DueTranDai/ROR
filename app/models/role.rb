class Role < ApplicationRecord
    has_many :users

  validates :name, presence: true, uniqueness: true
  validates :code, presence: true, uniqueness: true

  CODES = {
      :SYSTEM_ADMIN => 'system_admin',
      :ADMIN => 'admin',
      :TECHNICIAN => 'technician',
      :SUPERVISOR => 'supervisor',
      :ENGINEER => 'engineer',
      :FACILITY_MANAGER => 'facility_manager',
      :OPS_MANAGER => 'ops_manager'
  }
end
