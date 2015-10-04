class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name, :limit => 100

      t.timestamps null: false
    end
  end
end
