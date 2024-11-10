Rails.configuration.stripe = {
  publishable_key: ENV["pk_test_51QJdchP2KFfTkjU15XFXtkXLqpa5NgHhWwGuIR1fZNFsEsbeG3F5Avjyz3by7md1JECNwbcwXzqU0C2cY6i3Dzs500koLCFnCO"],
  secret_key: ENV["sk_test_51QJdchP2KFfTkjU1T7Vm8PhSoTwJpjyuOkl02gKwmqT56VpeGV6OFKpXpORaOmTNZsfFfGY9RxgLSnFIsQO58AeI00UpsMc7Wd"]
}
Stripe.api_key = Rails.configuration.stripe[:secret_key]