class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content
      t.string :site_name
      t.string :site_link

      t.timestamps
    end
  end
end
