require 'test_helper'

describe Product do
  it "creates a valid product" do
    product = Product.new(  name:        'Nothing box', 
                            description: 'The nothing box', 
                            price:       15.00 )
    product.save
    product.id.wont_be_nil
  end

  it "fails to create an invalid product" do
    product = Product.new(  name:        nil,
                            description: "algo",
                            price:       nil )
    product.save
    product.id.must_be_nil
  end

end
