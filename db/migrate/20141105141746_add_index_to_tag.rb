class AddIndexToTag < ActiveRecord::Migration
  def change
    add_column :tags, :tag_index, :string
    add_index :tags, :tag, unique: true
  end
end
