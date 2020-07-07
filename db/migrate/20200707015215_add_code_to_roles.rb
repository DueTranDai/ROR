class AddCodeToRoles < ActiveRecord::Migration[5.2]
  def change
    add_column :roles, :code, :string
  end
end
