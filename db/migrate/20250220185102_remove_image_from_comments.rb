class RemoveImageFromComments < ActiveRecord::Migration[7.2]
  def change
    remove_column :comments, :image, :string
  end
end
