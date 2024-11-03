class DirectorsController < ApplicationController
  def login (email, password)
    if email_in_database(email)
      user = User.where(email:email)
      if user.password == password
        user.loginStatus = true
        true
      else
        puts "Password is not correct"
        false
      else
        puts "Email not registered"
        false
  end

  def register(firstName, lastName, email, password)
    # Check if the email is in the database
    if email_in_database(email)
      puts "Customer already registered"
      false
    end
    # Email is not already in database 
    else 
      # Create new Customer
      # To do: Check validity of first name 
      # To do: Check validity of last name 
      # To do: Check validity of email 
      # To do: Check validity of password 
      Customer.create(firstName: firstName, lastName: lastName, email: email, password: password)
      # Return true because the registration was successful
      true
    end 
  end

  def email_in_database(email)
    # Checks Customer database and returns true if it exits otherwise false
    inDatabase = Customer.where(email: email).first != nil ? true : false
  end
end