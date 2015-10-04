class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name, :limit => 100
      t.references :state, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
