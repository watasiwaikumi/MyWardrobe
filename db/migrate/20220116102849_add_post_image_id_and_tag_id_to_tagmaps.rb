class AddPostImageIdAndTagIdToTagmaps < ActiveRecord::Migration[5.2]
  def change
    add_column :tagmaps, :post_image_id, :integer
    add_column :tagmaps, :tag_id, :integer
  end
end
