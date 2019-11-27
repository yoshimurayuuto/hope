class CreateShares < ActiveRecord::Migration[5.2]
  def change
    create_table :shares do |t|
      t.string :name
      t.string :title
      t.text :sharing
      t.timestamps
    end
  end
end
