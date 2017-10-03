class AddSlugToUsers < ActiveRecord::Migration
  def change
    add_column :users, :slug, :string, required: false
  end
end
