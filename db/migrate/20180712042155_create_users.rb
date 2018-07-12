class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :activation_digest
      t.text :password_digest
      t.string :avatar
      t.boolean :admin

      t.timestamps
    end
  end
end
