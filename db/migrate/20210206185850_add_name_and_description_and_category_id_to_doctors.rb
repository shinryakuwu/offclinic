class AddNameAndDescriptionAndCategoryIdToDoctors < ActiveRecord::Migration[6.1]
  def change
    add_column :doctors, :name, :string
    add_column :doctors, :description, :string
    add_column :doctors, :category_id, :integer
  end
end
