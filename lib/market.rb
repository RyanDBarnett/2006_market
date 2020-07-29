class Market
  attr_reader :name, :vendors
  def initialize name
    @name = name
    @vendors = []
  end

  def add_vendor vendor
    @vendors << vendor
  end

  def vendor_names
    @vendors.map(&:name)
  end

  def vendors_that_sell item
    @vendors.select do |vendor|
      vendor.inventory.keys.include?(item)
    end
  end

  def total_inventory
    @vendors.reduce({}) do |total_inventory, vendor|
      vendor.inventory.keys.each do |item|
        total_inventory[item] = {quantity: 0, vendors: []} unless total_inventory[item]
        total_inventory[item][:quantity] += vendor.inventory[item]
        total_inventory[item][:vendors] << vendor unless total_inventory[item][:vendors].include?(vendor)
      end
      total_inventory
    end
  end

  def overstocked_items
    total_inventory.keys.reduce([]) do |overstocked_items, item|
      if (total_inventory[item][:quantity] > 50 && total_inventory[item][:vendors].length > 1)
        overstocked_items << item
      end
      overstocked_items
    end
  end
end
