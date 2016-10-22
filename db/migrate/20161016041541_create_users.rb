class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :password_digest
      t.string :authentication_token
      t.boolean :admin, default: false
      t.timestamps
    end
  end
end
