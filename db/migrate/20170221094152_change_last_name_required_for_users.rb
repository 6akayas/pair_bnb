class ChangeLastNameRequiredForUsers < ActiveRecord::Migration[5.0]
  def change
    change_column_null :users, :last_name, true
  end
end
