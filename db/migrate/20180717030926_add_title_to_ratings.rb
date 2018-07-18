class AddTitleToRatings < ActiveRecord::Migration[5.2]
  def change
    add_column :ratings, :title, :string
  end
end
