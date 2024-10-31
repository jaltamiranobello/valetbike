class UsersController < ApplicationController
  def verify_account(userName, password)
    # if userName is not in database
    if User.where(userName: userName).count == 0
      false
    # userName is in database 
    else 
      # find user password associated 
      user = User.where(userName: userName)[0]
      # if the password is not the same as the one in the database 
      if user.password != password 
        false
      end 
    # if the userName is in the database and the password matches, then all good! 
    true 
  end

  def delete_account
  end
end
