class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.references :client, null: false, foreign_key: true
      t.string :house_no
      t.references :sub_district, null: false, foreign_key: true
      t.references :district, null: false, foreign_key: true
      t.references :province, null: false, foreign_key: true
      t.string :postcode

      t.timestamps
    end
  end
end
