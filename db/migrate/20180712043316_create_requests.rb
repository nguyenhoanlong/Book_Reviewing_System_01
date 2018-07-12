class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.text :content
      t.boolean :status
      t.references :user, foreign_key: true
      t.references :rating, foreign_key: true

      t.timestamps
    end
  end
end
