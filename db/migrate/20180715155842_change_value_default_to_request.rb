class ChangeValueDefaultToRequest < ActiveRecord::Migration[5.2]
  def change
    change_column :requests, :status, :boolean, default: false
  end
end
