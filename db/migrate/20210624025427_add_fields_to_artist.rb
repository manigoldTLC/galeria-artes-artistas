class AddFieldsToArtist < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :description, :text
  end
end
