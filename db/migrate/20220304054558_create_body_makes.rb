class CreateBodyMakes < ActiveRecord::Migration[6.0]
  def change
    create_table :body_makes do |t|
      t.integer :weight,        null:false
      t.string :text           
      t.references :user,       null:false, unique: true
      t.timestamps
    end
  end
end
