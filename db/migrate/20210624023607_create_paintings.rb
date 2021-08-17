class CreatePaintings < ActiveRecord::Migration[5.2]
  def change
    create_table :paintings do |t|
      t.string :name
      t.references :art_style, foreign_key: true
      t.references :artist, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
