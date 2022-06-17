class CustomersController < ApplicationController
  def index
    @customers=Customer.all.order(created_at: :desc)
  end

  def new
  
    @customer=Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @customer=Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    
    if @customer.update(customer_params)
      redirect_to root_path, status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy

    redirect_to root_path, status: :see_other
    
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :age, :gender)
  end
end
