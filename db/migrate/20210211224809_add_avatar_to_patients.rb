class AddAvatarToPatients < ActiveRecord::Migration[6.1]
  def change
    add_column :patients, :avatar, :string
  end
end
