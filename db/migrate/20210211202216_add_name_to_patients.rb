class AddNameToPatients < ActiveRecord::Migration[6.1]
  def change
    add_column :patients, :name, :string
  end
end
