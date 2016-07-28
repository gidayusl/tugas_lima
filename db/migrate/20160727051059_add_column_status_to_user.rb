class AddColumnStatusToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :activation_status, :string
  end
end
