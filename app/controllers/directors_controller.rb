class DirectorsController < ApplicationController

  # the view for this action is the main page
  def main 
  end 

  # the view for this action displays the form to register 
  def new
  end

  # intakes the parameters from the form to create a new Customer 
  def create 
    user = User.create(params[:customer])
    if user.valid?
      session[:user_id] = user.id
      # change to json messaging in the future 
      puts "Successful Registration"
      redirect_to(action: 'main') 
    else 
      puts "Unsuccessful Registration" 
    end 
  end

  def login
  end
  
end