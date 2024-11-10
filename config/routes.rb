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
  get 'trip/pay'
  get 'trip/confirmation'
  root to: "stations#index"
end