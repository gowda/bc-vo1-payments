class ChangeDeletedColumnDefaultInPayments < ActiveRecord::Migration[6.0]
  def change
    change_column_default :payments, :imported, from: nil, to: false
  end
end
