class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :name
      t.string :surname
      t.string :email
      t.string :birth_date
      t.string :country
      t.string :city
      t.string :district
      t.string :password_digest
      t.string :remember_token
      t.timestamps
    end
    add_index :users,[ :email, :username ], unique: true 
  end
end
