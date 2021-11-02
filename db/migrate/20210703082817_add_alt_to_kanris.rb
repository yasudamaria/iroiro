class AddAltToKanris < ActiveRecord::Migration[6.1]
  def change
    add_column :kanris, :alt, :string
  end
end
