class RemoveCategoryFromTransactions < ActiveRecord::Migration[7.0]
  def change
    remove_column :transactions, :category, :string
  end
end
