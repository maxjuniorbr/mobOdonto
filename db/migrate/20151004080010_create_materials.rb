class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.references :measurement, index: true, foreign_key: true
      t.string :code
      t.string :name
      t.text :note
      t.integer :minimal

      t.timestamps null: false
    end
  end
end
