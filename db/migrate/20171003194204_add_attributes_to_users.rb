class AddAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :hair_type, :string, required: false
    add_column :users, :skin_type, :string, required: false
    add_column :users, :makeup, :string, required: false
    add_column :users, :niche, :string, required: false
    add_column :users, :category, :string, required: false
  end
end
