class AddFieldToPainting < ActiveRecord::Migration[5.2]
  def change
    add_column :paintings, :year, :string
  end
end
