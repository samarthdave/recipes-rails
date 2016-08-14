class AddChefnameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :chefname, :string
  end
end
