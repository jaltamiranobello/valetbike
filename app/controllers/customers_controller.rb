class CustomersController < ApplicationController
  # the view for this action displays the form to login 
  def new 
  end 

  # processes the parameters of the login form to set current Customer
  def create 
    # user = User.find_by(username: params(:username))
    # if user password is correct 
      # then set session[:user_id] = user.id
      # send confirmation message 
      # re route to main page 
    # else, user password is incorrect
      # send error message 
  end 

  # displays Customer data
  def show 
  end 

  # the view for this action displays the form to edit Customer 
  def edit 
  end

  # processes the parameters of the edit form 
  def update 
  end

  # processes the deletion of account
  def destroy
  end 

  def start_trip
  end

  def end_trip
  end

  def past_trip_calculations
  end

  def customer_params
    params.require(:customer).permit(:firstName, :lastNAme, :email, :password)
  end
end
