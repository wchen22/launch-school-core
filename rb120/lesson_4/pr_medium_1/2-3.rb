# Alan created the following code to keep track of items for a shopping cart application he's writing:

class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end

# Alyssa looked at the code and spotted a mistake. "This will fail when update_quantity is called", she says.

# Can you spot the mistake and how to address it?

# update_quantity will run, but it won't update the instance variable as desired. Can fix by either adding a `@`, or create a setter and call it using `self.`

class InvoiceEntry
  attr_reader :product_name
  attr_accessor :quantity

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    self.quantity = updated_count if updated_count >= 0
  end
end

tuna = InvoiceEntry.new("tuna", 10)
tuna.update_quantity(11)
puts tuna.quantity

# Alyssa noticed that this will fail when update_quantity is called. Since quantity is an instance variable, it must be accessed with the @quantity notation when setting it. One way to fix this is to change attr_reader to attr_accessor and change quantity to self.quantity.

# Is there anything wrong with fixing it this way?

# This will expose a setter method for @product_name as well which might not be desired. To address that we can use attr_reader for @product_name and attr_accessor for @quantity.

# Also, this will expose a setter for @quantity which will allow instance.quantity = (value) which might also not be desirable if you want update_quantity to be the only interface by which quantity is changed.