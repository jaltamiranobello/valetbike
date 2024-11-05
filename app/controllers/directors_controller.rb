class DirectorsController < ApplicationController

  # the view for this action is the main page
  def main 
  end 

  # the view for this action displays the form to register 
  def new
    # user = User.create(pass in parameters)
    # if user.valid? (uses validations)
      # then set session[:user_id] = user.id
      # send confirmation message 
      # re route to main page 
    # else 
      # send message that registration was unsuccessful 
  end

  # intakes the parameters from the form to create a new Customer 
  def create 
  end 

end