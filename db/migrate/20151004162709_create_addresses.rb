class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street, :limit => 100
      t.string :number, :limit => 10
      t.string :complement, :limit => 100
      t.string :neighborhood, :limit => 100
      t.string :zip, :limit => 9
      t.references :patient, index: true, foreign_key: true
      t.references :city, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
