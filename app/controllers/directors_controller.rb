class DirectorsController < ApplicationController

  def new
  end


  # def login (email, password)
  #   # Check if email is in database 
  #   if email_in_database(email)
  #     # Find Costumer with associated email 
  #     costumer = Customer.where(email:email)
  #     # Check if the password matches
  #     if costumer.password == password
  #       # Set login status 
  #       costumer.loginStatus = true
  #       true
  #     # If the password is incorrect 
  #     else
  #       puts "Password is not correct"
  #       false
  #   # Email is not in database 
  #   else
  #     puts "Email not registered"
  #     false
  #   end 
  # end

  # def register(firstName, lastName, email, password)
  #   # Check if the email is in the database
  #   if email_in_database(email)
  #     puts "Customer already registered"
  #     false
  #   end
  #   # Email is not already in database 
  #   else 
  #     # Create new Customer
  #     # To do: Check validity of first name 
  #     # To do: Check validity of last name 
  #     # To do: Check validity of email 
  #     # To do: Check validity of password 
  #     Customer.create(firstName: firstName, lastName: lastName, email: email, password: password)
  #     # Return true because the registration was successful
  #     true
  #   end 
  # end

  # def email_in_database(email)
  #   # Checks Customer database and returns true if it exits otherwise false
  #   inDatabase = Customer.where(email: email).first != nil ? true : false
  # end
end