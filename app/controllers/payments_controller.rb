class PaymentsController < ApplicationController
  # After you finish a trip, you are sent to this action which starts a payment link 
  # Which is then displayed in the corresponding view 
  def new
    # First, find the trip given the trip ID passed in from trips#update
    @trip = Trip.find_by_id(params[:param_1])
    # Then, find the price of the trip (in dollars) and multiply by 100
    # because Stripe intakes prices in cents 
    # If the trip price is  less than 0.5 dollars / 50 cents, 
    # replace with a charge of 51 cents so that the charge is large enough for Stripe
    @tripPrice = @trip.price > 0.5 ? @trip.price * 100  : 51
    # create price object
    priceObject = Stripe::Price.create({
      currency: 'usd',
      unit_amount: @tripPrice,
      product_data: {name: 'Trip'},
    })
    # create a payment link
    @paymentLink = Stripe::PaymentLink.create({
      line_items: [
        {
          price: priceObject,
          quantity: 1
        },
      ],
      after_completion: {
          type: 'redirect',
          redirect: {url: 'http://localhost:3000/payments/success'},
      }
    })
  end
end
