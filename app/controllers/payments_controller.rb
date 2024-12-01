class PaymentsController < ApplicationController
  def new
  end

  def create
    #create stripe customer for payment, update if already created
    customer = Stripe::Customer.create(
      name: current_user.full_name,
      email: current_user.email,
      description: "Customer id: #{current_user.id}",
    )
    session = Stripe::Checkout::Session.create( 
      customer: customer, 
      payment_method_types: [‘card’],
      line_items: [{
        price: 'price_1234', #price api id usually starts with price_ApIiD
        quantity: 1,
      }],
      mode: 'subscription',
      success_url:  payments_success_url,
      cancel_url: payments_cancel_url
     )
     redirect_to session.url
  end

  def edit
  end

  def update
  end
end
