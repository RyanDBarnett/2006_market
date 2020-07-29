require 'minitest/autorun'
require 'minitest/pride'
require './lib/vendor'

class VendorTest < Minitest::Test
  def setup
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
end
