class PaymentsController < ApplicationController
  def new
    @trip = Trip.find_by_id(params[:param_1])
    @tripPrice = Integer(@trip.price * 100)
    # trip must be greater than 50 cents 
    @tripPrice = @tripPrice > 50 ? @tripPrice : 51
    # create price object
    priceObject = Stripe::Price.create({
      currency: 'usd',
      unit_amount: @tripPrice,
      product_data: {name: 'Trip'},
    })
    # create a new link
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

  def create
  end

  def edit
  end

  def update
  end
end