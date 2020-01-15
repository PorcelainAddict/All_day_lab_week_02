require('minitest/autorun')
require('minitest/reporters')

require_relative('../customer.rb')
require_relative('../drink.rb')
require_relative('../pub.rb')


Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new

class TestCustomer < Minitest::Test
  def setup( )

@customer = Customer.new("Jack Portwood", 500, 29, 0)

@drink1 = Drink.new("Pint of Gin", 20, 23)
@drink2 = Drink.new("Boot of beer", 3, 6)
@drink3 = Drink.new("Flannel of wine", 5, 10)


  end

  def test_customer_name()
    assert_equal("Jack Portwood", @customer.customer_name)
  end

  def test_customer_money()
    assert_equal(500, @customer.customer_wallet)
  end

  def test_buy_drink()
    @customer.buy_drink(@drink1.drink_price, @drink1.alcohol_level)
    assert_equal(480, @customer.customer_wallet)
    assert_equal(23, @customer.drunkeness_level)
  end

  def test_customer_age()
    assert_equal(29, @customer.customer_age)
  end

  def test_customer_steam_level
    assert_equal(0, @customer.drunkeness_level)
  end


end
