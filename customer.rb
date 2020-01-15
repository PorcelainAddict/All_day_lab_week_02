class Customer

  attr_accessor :customer_name, :customer_wallet, :customer_age, :drunkeness_level

  def initialize(customer_name, customer_wallet, customer_age, drunkeness_level)
    @customer_name = customer_name
    @customer_wallet = customer_wallet
    @customer_age = customer_age
    @drunkeness_level = drunkeness_level
  end


  def buy_drink(drink)
    @customer_wallet -= drink.drink_price
    @drunkeness_level += drink.alcohol_level
  end

end
