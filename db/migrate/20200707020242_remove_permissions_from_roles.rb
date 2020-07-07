class RemovePermissionsFromRoles < ActiveRecord::Migration[5.2]
  def change
    remove_column :roles, :permissions, :string
  end
end
