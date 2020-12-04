require 'test/unit'

require_relative '../lib/bowling_score/pinfalls'

class BowlingScore::PinfallsTest < Test::Unit::TestCase
  include BowlingScore

  def setup
    @pinfalls = Pinfalls.new(frames: valid_input)
  end

  def test_values
    @pinfalls.generate
    assert_equal(expected_output, @pinfalls.formatted_values)
  end

  private

  def valid_input
    [[10, 0], [7, 3], [9, 0], [10, 0], [0, 8], [8, 2], [0, 6], [10, 0], [10, 0], [10, 8, 1]]
  end

  def expected_output
    "\tX\t7\t/\t9\t0\t\tX\t0\t8\t8\t/\t0\t6\t\tX\t\tX\tX\t8\t1\t"
  end
end