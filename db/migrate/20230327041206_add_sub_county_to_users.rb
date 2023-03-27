class AddSubCountyToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :sub_county, :string
  end
end
