class ChangeDataTypeToGender < ActiveRecord::Migration[7.1]
  def change
    change_column(:profiles, :gender, :string)
  end
end
