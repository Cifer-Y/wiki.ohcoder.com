class RemoveTagIndexFromTag < ActiveRecord::Migration
  def change
    remove_column :tags, :tag_index
    remove_index :tags, :tag
  end
end
