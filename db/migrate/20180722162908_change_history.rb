class ChangeHistory < ActiveRecord::Migration[5.2]
  def change
    add_column :histories, :object_id, :integer
    add_column :histories, :historyable_id, :integer
    add_column :histories, :historyable_type, :string
  end
end
