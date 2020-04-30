class AddTimeColumnToPayments < ActiveRecord::Migration[6.0]
  def change
    add_column :payments, :time, :datetime
  end
end
