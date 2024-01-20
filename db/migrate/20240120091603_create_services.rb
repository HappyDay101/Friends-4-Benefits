class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.string :service_name
      t.string :location
      t.references :user, null: false, foreign_key: true
      t.string :category
      t.string :description
      t.integer :price

      t.timestamps
    end
  end
end
