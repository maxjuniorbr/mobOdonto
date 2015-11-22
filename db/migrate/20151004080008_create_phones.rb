class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.references :patient, index: true, foreign_key: true
      t.string :landline_phone
      t.string :cell_phone
      t.string :business_phone
      t.string :other_phone
      t.string :other_phone_contact

      t.timestamps null: false
    end
  end
end
