class Confirmation < ActiveRecord::Base	
	belongs_to :appointment
	belongs_to :user

	def process_payment
    customer = Stripe::Customer.create email: email,
                                       card: card_token

    Stripe::Charge.create customer: customer.id,
                          amount: appointment.price * 100,
                          description: appointment.name,
                          currency: 'usd'

  end
  
end
