class CreateDistricts < ActiveRecord::Migration[7.0]
  def change
    create_table :districts do |t|
      t.string :name
      t.integer :code
      t.string :name_th
      t.references :province, null: false, foreign_key: true

      t.timestamps
    end
  end
end
