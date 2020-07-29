require 'minitest/autorun'
require 'minitest/pride'
require './lib/vendor'
require './lib/item'
require './lib/market'

class VendorTest < Minitest::Test
  def setup
    # @item1 = Item.new({name: 'Peach', price: "$0.75"})
    # @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    # @vendor = Vendor.new('Rocky Mountain Fresh')
    @market = Market.new("South Pearl Street Farmers Market")
  end

  def test_it_exists
    assert_instance_of Market, @market
  end
end