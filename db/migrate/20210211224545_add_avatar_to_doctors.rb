class AddAvatarToDoctors < ActiveRecord::Migration[6.1]
  def change
    add_column :doctors, :avatar, :string
  end
end
