class PaymentsController < ApplicationController
  def new
    # create a new link 
    tripPrice = 1000
    # create price object
    priceObject = Stripe::Price.create({
      currency: 'usd',
      unit_amount: tripPrice,
      product_data: {name: 'Trip'},
    })
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
