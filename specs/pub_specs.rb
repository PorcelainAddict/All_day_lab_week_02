require('minitest/autorun')
require('minitest/reporters')

require_relative('../customer.rb')
require_relative('../drink.rb')
require_relative('../pub.rb')


Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new

class TestPub < Minitest::Test

  def setup()



    @drink1 = Drink.new("Pint of Gin", 20, 23)
    @drink2 = Drink.new("Boot of beer", 3, 6)
    @drink3 = Drink.new("Flannel of wine", 5, 10)

    @drinks = [@drink1, @drink2, @drink3]

    @customer = Customer.new("Jack Portwood", 500, 29, 0)

    @pub = Pub.new("The Social Media Analyst Arms", @drinks, 1000)


  end

  def test_pub_name
    assert_equal("The Social Media Analyst Arms", @pub.name)
  end

  def test_sell_drink
    @pub.sell_drink(@drink1)
    assert_equal(1020, @pub.till_cash)
  end

  def test_pub_stock_count()
    assert_equal(3, @pub.stock_count)
  end

  def test_remove_drink
    @pub.remove_drink(@drink1)
    assert_equal(2, @pub.stock_count)
  end

  def test_sells_drink_to_customer
    @pub.sell_drink(@drink1)
    @pub.remove_drink(@drink1)
    @customer.buy_drink(@drink1)
    assert_equal(2, @pub.stock_count)
    assert_equal(1020, @pub.till_cash)
    assert_equal(480, @customer.customer_wallet)
  end

  def test_transaction
    @pub.sells_drink_to_customer(@drink1, @customer)
    assert_equal(29, @customer.customer_age)
    assert_equal(23, @customer.drunkeness_level)
    assert_equal(2, @pub.stock_count)
    assert_equal(1020, @pub.till_cash)
    assert_equal(480, @customer.customer_wallet)



  end







end
