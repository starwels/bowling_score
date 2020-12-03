require 'test/unit'

require_relative '../lib/bowling_score/pinfalls'

class PinfallsTest < Test::Unit::TestCase
  include BowlingScore

  def setup
    @pinfalls = Pinfalls.new(frames: valid_input)
  end

  def test_values
    @pinfalls.generate
    assert_equal(expected_output, @pinfalls.values)
  end

  private

  def valid_input
    [[10, 0], [7, 3], [9, 0], [10, 0], [0, 8], [8, 2], [0, 6], [10, 0], [10, 0], [10, 8, 1]]
  end

  def expected_output
    ['', 'X', '7', '/', '9', '0', '', 'X', '0', '8', '8', '/', '0', '6', '', 'X', '', 'X', 'X', '8', '1']
  end
end