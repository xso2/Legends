class CreateMealRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :meal_records do |t|
      t.string :text
      t.integer :calorie
      t.references :user,   null:false, unique: true
      t.timestamps
    end
  end
end
