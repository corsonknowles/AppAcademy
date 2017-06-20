class GiveUserAUsername < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :email
    remove_column :users, :name

  end
end
