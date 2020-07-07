class CreateGoodCatches < ActiveRecord::Migration[5.2]
  def change
    create_table :good_catches do |t|

      t.timestamps
    end
  end
end
