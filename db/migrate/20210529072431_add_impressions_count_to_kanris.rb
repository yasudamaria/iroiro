class AddImpressionsCountToKanris < ActiveRecord::Migration[6.1]
  def change
    add_column :kanris, :impressions_count, :integer, default: 0
  end
end
