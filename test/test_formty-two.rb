require 'minitest/autorun'
require 'formty-two'

class FormtyTwoTest < Minitest::Test

  def test_bad_id
    refute_equal true,
      FormtyTwo.generate('')
  end

end
