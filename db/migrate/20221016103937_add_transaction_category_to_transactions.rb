class AddTransactionCategoryToTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :transaction_category, :string
  end
end
