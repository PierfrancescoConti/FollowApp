class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :usname
      t.string :password_digest
      t.string :friends, array: true, default: []
      t.string :image

      t.timestamps
    end
  end
end
