require 'minitest/autorun'
require 'formty-two'

class FormtyTwoTest < Minitest::Test

  def test_no_id
    assert_equal false,
      FormtyTwo.generate('')
  end

end
