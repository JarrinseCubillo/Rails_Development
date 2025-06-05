class RemoveNameFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_columns(:users, :name, :birth, :city, :country, :role, :gender)
  end
end
