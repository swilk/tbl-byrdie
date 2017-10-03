class AddRoutineAttrToUsers < ActiveRecord::Migration
  def change
    add_column :users, :routine, :string, required: false
    add_column :users, :email, :string, required: false
    add_column :users, :age, :integer, required: false
    add_column :users, :birthday, :date, required: false
  end
end
