require 'minitest/autorun'
require 'minitest/pride'
require './lib/vendor'
require './lib/item'

class VendorTest < Minitest::Test
  def setup
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @vendor = Vendor.new('Rocky Mountain Fresh')
  end

  def test_it_exists
    assert_instance_of Vendor, @vendor
  end

  def test_has_name
    assert_equal 'Rocky Mountain Fresh', @vendor.name
  end

  def test_has_empty_inventory_by_default
    assert_equal({}, @vendor.inventory)
  end

  def test_check_stock
    assert_equal 0, @vendor.check_stock(@item1)
  end

  def test_stock
    @vendor.stock(@item1, 30)

    expected = {@item1 => 30}

    assert_equal expected, @vendor.inventory

    assert_equal 30, @vendor.check_stock(@item1)

    @vendor.stock(@item1, 25)

    assert_equal 55, @vendor.check_stock(@item1)

    @vendor.stock(@item2, 12)

    expected = {@item1 => 55, @item2 => 12}

    assert_equal expected, @vendor.inventory
  end
end
