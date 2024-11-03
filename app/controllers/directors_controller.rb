class DirectorsController < ApplicationController
  def login(email:string, password:string)
    if verify_email(email)
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

  def register
  end

  def verify_email(email:string)
    #Checks Customer database and returns true if it exits otherwise false
    inDatabase = Customer.where(email: email).first != nil ? true : false
    inDatabase
  end
