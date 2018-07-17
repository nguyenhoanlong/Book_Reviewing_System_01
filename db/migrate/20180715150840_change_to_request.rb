class ChangeToRequest < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :name_book, :string
    remove_column :requests, :rating_id
  end
end
