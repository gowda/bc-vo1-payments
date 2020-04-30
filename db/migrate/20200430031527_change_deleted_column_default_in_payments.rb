class ChangeDeletedColumnDefaultInPayments < ActiveRecord::Migration[6.0]
  def change
    change_column_default :payments, :deleted, from: nil, to: false
  end
end
