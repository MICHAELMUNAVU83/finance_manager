class TransactionsController < ApplicationController
  before_action :set_category
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  # GET categories/1/transactions
  def index
    @transactions = @category.transactions
  end

  # GET categories/1/transactions/1
  def show
  end

  # GET categories/1/transactions/new
  def new
    @transaction = @category.transactions.build
  end

  # GET categories/1/transactions/1/edit
  def edit
  end

  # POST categories/1/transactions
  def create
    @transaction = @category.transactions.build(transaction_params)

    if @transaction.save
      redirect_to([@transaction.category, @transaction], notice: 'Transaction was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT categories/1/transactions/1
  def update
    if @transaction.update_attributes(transaction_params)
      redirect_to([@transaction.category, @transaction], notice: 'Transaction was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE categories/1/transactions/1
  def destroy
    @transaction.destroy

    redirect_to category_transactions_url(@category)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:category_id])
    end

    def set_transaction
      @transaction = @category.transactions.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def transaction_params
      params.require(:transaction).permit(:name, :amount, :category_id, :user_id)
    end
end
