require 'test/unit'

require_relative '../../lib/bowling_score/validator'

class ValidatorTest < Test::Unit::TestCase
  include BowlingScore

  def test_invalid_input
    assert_raise( InvalidValue ) { Validator.new(values: [1, 2, 3, -1]).call }
    assert_raise( InvalidThrowsLength ) { Validator.new(values: (0..10).to_a).call }
  end

  def test_valid_input
    assert_nothing_raised { Validator.new(values: Array.new(21, 1) ).call }
  end
end