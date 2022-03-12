class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.references :gender, null: false, foreign_key: true
      t.date :birthday
      t.string :phone
      t.string :email
      t.references :race, null: false, foreign_key: true
      t.references :shirt_size, null: false, foreign_key: true

      t.timestamps
    end
  end
end
