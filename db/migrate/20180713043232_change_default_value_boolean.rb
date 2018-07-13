class ChangeDefaultValueBoolean < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :admin, :boolean, :default => false
    change_column :user_books, :read, :boolean, :default => false
    change_column :user_books, :favorite, :boolean, :default => false
    change_column :user_books, :reading, :boolean, :default => false
    change_column :user_books, :request, :boolean, :default => false
    change_column :users, :activated, :boolean, :default => false
  end
end
