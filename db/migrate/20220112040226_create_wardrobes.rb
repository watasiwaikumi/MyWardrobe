class CreateWardrobes < ActiveRecord::Migration[5.2]
  def change
    create_table :wardrobes do |t|
      
      t.string "title"
      t.text "body"
      t.integer "user_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false

      t.timestamps
    end
  end
end
