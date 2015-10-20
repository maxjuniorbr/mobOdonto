class AddCpfToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :cpf, :string
  end
end
