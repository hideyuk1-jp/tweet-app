class CreateUserimages < ActiveRecord::Migration[5.2]
  def change
    create_table :userimages do |t|
      t.string :name
      t.binary :picture

      t.timestamps
    end
  end
end
