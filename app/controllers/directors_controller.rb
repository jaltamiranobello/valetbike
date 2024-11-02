class DirectorsController < ApplicationController
  def login
  end

  def register
  end

  def verify_email(email:string)
    #Checks Customer database and returns true if it exits otherwise false
    inDatabase = Customer.where(email: email).first != nil ? true : false
    inDatabase
  end
