class AddTagCountToTag < ActiveRecord::Migration
  def change
    add_column :tags, :tag_count, :integer
  end
end
