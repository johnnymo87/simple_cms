class AddCountryAndCapitalToAdminUsers < ActiveRecord::Migration
  def change
    add_column :admin_users, :country, :string
    add_column :admin_users, :capital, :string
  end
end
