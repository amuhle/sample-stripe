require 'stripe_mock'
require 'spec_helper.rb'

describe "SampleStripeProject" do
  before { StripeMock.start }
  after { StripeMock.stop }

  it "creates a simple stripe customer" do

    # This doesn't touch stripe's servers nor the internet!
    customer = Stripe::Customer.create({
      email: 'alvaro@vairix.com',
      card: 'void_card_token'
    })
    expect(customer.email).to eq('alvaro@vairix.com')
  end
end