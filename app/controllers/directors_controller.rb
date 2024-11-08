class DirectorsController < ApplicationController

  # the view for this action is the main page
  def main 
  end 

  # the view for this action displays the form to register 
  def new
  end

  # intakes the parameters from the form to create a new Customer 
  def create 
    customer = Customer.create(params[:customer])
    if customer.valid?
      session[:customer_id] = user.id
      # change to json messaging in the future 
      puts "Successful Registration"
      redirect_to(action: 'main') 
    else 
      puts "Unsuccessful Registration" 
    end 
  end 

  def customer_params
    params.require(:customer).permit(:firstName, :lastName, :email, :password)
  end
  
end