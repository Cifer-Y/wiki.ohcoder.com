class RemoveTagCountFromTag < ActiveRecord::Migration
  def change
    remove_column :tags, :tag_count, :integer
  end
end
