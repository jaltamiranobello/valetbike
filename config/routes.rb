Rails.application.routes.draw do
  get 'card/remove_card'
  get 'card/update_payment'
  get 'card/verify_payment'
  get 'card/pay'
  get 'bike/get_bike_id'
  get 'bike/get_station_id'
  get 'bike/get_station_name'
  get 'bike/get_battery_percentage'
  get 'users/verify_account'
  get 'users/delete_account'
  get 'trip/index'
  get 'trip/book'
  get 'trip/confirm'
  
  root to: "stations#index"

  get "stations/show"
  get "stations/index"

  


  get 'bikes/index'
  get 'bikes/show'
  get 'bikes/edit'
  get 'bikes/delete'
  get 'bikes/new'
  

#developed this new route to use it later in the html page
#so that we could display the bikes and the stations in different view pages



end
