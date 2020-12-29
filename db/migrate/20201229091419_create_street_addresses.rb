class CreateStreetAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :street_addresses do |t|

      t.timestamps
    end
  end
end
