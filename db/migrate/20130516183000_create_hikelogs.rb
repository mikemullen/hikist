class CreateHikelogs < ActiveRecord::Migration
  def change
    create_table :hikelogs do |t|
      t.text :content
      t.integer :user_id
      t.string :title
      t.string :location
      t.date :date_of_hike
      t.decimal :length_of_hike
      t.integer :elevation_change

      t.timestamps
    end
    add_index :hikelogs, :user_id
  end
end
