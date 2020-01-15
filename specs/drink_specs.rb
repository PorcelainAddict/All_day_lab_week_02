require('minitest/autorun')
require('minitest/reporters')

require_relative('../customer.rb')
require_relative('../drink.rb')
require_relative('../pub.rb')


Minitest::Reporters.use!
Minitest::Reporters::SpecReporter.new

class TestDrink < Minitest::Test

  def setup()
    @drink1 = Drink.new("Pint of Gin", 20, 23)
    @drink2 = Drink.new("Boot of beer", 3, 6)
    @drink3 = Drink.new("Flagon of wine", 5, 10)

    @drink = [@drink1, @drink2, @drink3]

  end

  def test_drink_name
    assert_equal("Pint of Gin", @drink1.drink_name)
  end

  def test_alcohol_level
    assert_equal(23, @drink1.alcohol_level)
  end 




end
