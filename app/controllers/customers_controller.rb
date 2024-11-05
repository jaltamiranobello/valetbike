class CustomersController < ApplicationController
  # the view for this action displays the form to login 
  def new 
  end 

  # processes the parameters of the login form to create a new Ccustomer
  def create 
    # user = User.create(pass in parameters)
    # if user.valid? (uses validations)
      # then set session[:user_id] = user.id
      # send confirmation message 
      # re route to main page 
    # else 
      # send message that login was unsuccessful 
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
end
