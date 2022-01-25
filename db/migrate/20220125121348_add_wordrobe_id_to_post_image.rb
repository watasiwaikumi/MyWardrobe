class AddWordrobeIdToPostImage < ActiveRecord::Migration[5.2]
  def change
    add_column :post_images, :wardrobe_id, :integer
  end
end
