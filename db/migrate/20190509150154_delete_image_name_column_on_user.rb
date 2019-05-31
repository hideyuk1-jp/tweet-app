class DeleteImageNameColumnOnUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :image_name, :string
  end
end
