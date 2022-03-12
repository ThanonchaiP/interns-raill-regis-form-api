class CreateShirtSizes < ActiveRecord::Migration[7.0]
  def change
    create_table :shirt_sizes do |t|
      t.string :size
      t.integer :chest

      t.timestamps
    end
  end
end
