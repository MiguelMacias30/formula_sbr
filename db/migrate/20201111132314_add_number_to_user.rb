class AddNumberToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :number, :integer
  end
end
