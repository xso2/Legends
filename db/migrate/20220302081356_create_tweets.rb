class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.text :text,        null:false
      t.references :user,   null:false, unique: true
      t.timestamps
    end
  end
end
