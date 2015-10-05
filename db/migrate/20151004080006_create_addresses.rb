class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :patient, index: true, foreign_key: true
      t.string :street
      t.string :number
      t.string :complement
      t.string :neighborhood
      t.string :zip
      t.references :city, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
