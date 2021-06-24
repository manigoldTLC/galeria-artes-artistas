class AddDescriptionToArtStyles < ActiveRecord::Migration[5.2]
  def change
    add_column :art_styles, :description, :text
  end
end
