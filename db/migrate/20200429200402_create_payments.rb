class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.integer :value
      t.string :description
      t.references :contract
      t.boolean :deleted
      t.boolean :imported

      t.timestamps
    end
  end
end
