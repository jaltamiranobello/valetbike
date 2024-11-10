class Card < ApplicationRecord
  # Example methods for the Card model

  # Remove the card instance
  def remove_card
    destroy
  end

  # Verify the card
  def verify
    update(verified: true)
  end

  # Process a payment
  def pay(amount)
    if card_balance >= amount
      update(card_balance: card_balance - amount)
      true
    elses
      false
    end
  end
end
