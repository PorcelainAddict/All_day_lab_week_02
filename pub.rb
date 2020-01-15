class Pub

  attr_reader :name, :drinks, :till_cash

  def initialize(name, drinks, till_cash)
    @name = name
    @drinks = drinks
    @till_cash = till_cash
    # @drinks_sold = 20


  end

  def sell_drink(drink)
    @till_cash += drink.drink_price
  end

  def stock_count
    return @drinks.count
  end

  def remove_drink(drink)
    @drinks.delete(drink)
  end

  def sells_drink_to_customer(drink, customer)
    if customer.customer_age >= 18
      case customer.drunkeness_level
      when 0
        p "Buy a drink"
        sell_drink(drink)
        remove_drink(drink)

        customer.buy_drink(drink)
      when  1..10
        p "Get another drink"
        sell_drink(drink)
        remove_drink(drink)

        customer.buy_drink(drink)
      when 11..23
        p "Yer steaming"
        sell_drink(drink)
        remove_drink(drink)

        customer.buy_drink(drink)
      when 24..25
        sell_drink(drink)
        remove_drink(drink)

        customer.buy_drink(drink)
      else p "Yer oot"
      end
    end
    return p "Away with ye young feller!!!!!!!"
  end

end
