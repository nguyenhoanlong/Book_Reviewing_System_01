class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.text :description
      t.string :image
      t.string :author
      t.integer :number_of_pages
      t.float :price
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
