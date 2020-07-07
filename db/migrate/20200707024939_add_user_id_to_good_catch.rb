class AddUserIdToGoodCatch < ActiveRecord::Migration[5.2]
  def change
    add_column :good_catches, :user_id, :integer
  end
end
