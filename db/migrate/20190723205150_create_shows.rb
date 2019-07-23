class CreateShows < ActiveRecord::Migration[6.0]
  def change
    create_table :shows do |t|
      t.string :url
      t.string :name
      t.string :network
      t.string :image
      t.boolean :favorite

      t.timestamps
    end
  end
end
