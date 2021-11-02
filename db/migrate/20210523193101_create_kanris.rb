class CreateKanris < ActiveRecord::Migration[6.1]
  def change
    create_table :kanris do |t|
      t.string :genre
      t.string :title
      t.text :body
      t.string :image
      t.string :url

      t.timestamps
    end
  end
end
