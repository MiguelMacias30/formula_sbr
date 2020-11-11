class CreateAppoinments < ActiveRecord::Migration[5.2]
  def change
    create_table :appoinments do |t|
      t.datetime :day
      t.references :service, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
