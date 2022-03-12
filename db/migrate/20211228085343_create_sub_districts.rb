class CreateSubDistricts < ActiveRecord::Migration[7.0]
  def change
    create_table :sub_districts do |t|
      t.string :name
      t.integer :code
      t.string :name_th
      t.integer :post_code
      t.references :district, null: false, foreign_key: true

      t.timestamps
    end
  end
end
