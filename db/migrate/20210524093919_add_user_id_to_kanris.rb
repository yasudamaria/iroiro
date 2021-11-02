class AddUserIdToKanris < ActiveRecord::Migration[6.1]
  def change
    add_column :kanris, :user_id, :integer
  end
end
