class AddUserIdToCalendars < ActiveRecord::Migration[5.2]
  def change
    add_column :calendars, :user_id, :integer
  end
end
