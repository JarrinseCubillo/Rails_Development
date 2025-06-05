class RemoveGenderFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :gender
  end
end
