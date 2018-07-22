class AddTypeHistoryToHistory < ActiveRecord::Migration[5.2]
  def change
    add_column :histories, :type_history, :integer
  end
end
