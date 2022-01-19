class AddDetailsToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :user_id, :integer
    add_column :events, :all_day, :string
    add_column :events, :disp_flg, :boolean
  end
end
