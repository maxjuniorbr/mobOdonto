class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :number
      t.string :contact_name
      t.integer :phone_type
      t.references :patient, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
