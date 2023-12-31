class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :remember_digest
      t.string :address
      t.integer :type_account
      t.string :image
      t.string :phone
      t.integer :status

      t.timestamps
    end
  end
end
