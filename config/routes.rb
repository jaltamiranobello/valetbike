Rails.application.routes.draw do
  
  root to: "stations#index"

  get "stations/show"


  get 'bikes/index'
  get 'bikes/show'
  get 'bikes/edit'
  get 'bikes/delete'
  get 'bikes/new'
  

#developed this new route to use it later in the html page
#so that we could display the bikes and the stations in different view pages



end
