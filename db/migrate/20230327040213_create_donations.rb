class CreateDonations < ActiveRecord::Migration[7.0]
  def change
    create_table :donations do |t|
      t.string :type_of_donation
      t.integer :weight
      t.string :nature
      t.string :drop_off_point
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
