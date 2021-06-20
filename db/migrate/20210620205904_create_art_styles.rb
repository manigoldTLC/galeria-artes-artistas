class CreateArtStyles < ActiveRecord::Migration[5.2]
  def change
    create_table :art_styles do |t|
      t.string :name
      t.references :paintings, foreign_key: true

      t.timestamps
    end
  end
end
