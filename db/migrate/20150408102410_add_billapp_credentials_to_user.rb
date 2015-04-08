class AddBillappCredentialsToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :billapp_agenda, :string
    add_column :users, :billapp_user, :string
    add_column :users, :billapp_password, :string
  end
end
