class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name, :limit => 100
      t.string :initial, :limit => 2
      t.references :country, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
