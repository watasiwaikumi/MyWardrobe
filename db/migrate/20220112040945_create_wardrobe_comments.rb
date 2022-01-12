class CreateWardrobeComments < ActiveRecord::Migration[5.2]
  def change
    create_table :wardrobe_comments do |t|
      
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.text "comment"
      t.integer "user_id"
      t.integer "wardrobe_id"

      t.timestamps
    end
  end
end
