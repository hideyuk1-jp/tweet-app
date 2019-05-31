class ChangeUserimageColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :userimages, :user_id, :integer

    remove_column :userimages, :name, :string
  end
end
