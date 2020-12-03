require 'test/unit'

require_relative '../lib/bowling_score/frames'

class FramesTest < Test::Unit::TestCase
  include BowlingScore

  def setup
    @frames = Frames.new(rolls: valid_input)
  end

  def test_fill
    @frames.fill
    assert_equal(@frames.values, expected_output)
  end

  private

  def valid_input
    [10, 7, 3, 9, 0, 10, 0, 8, 8, 2, 0, 6, 10, 10, 10, 8, 1]
  end

  def expected_output
    [[10, 0], [7, 3], [9, 0], [10, 0], [0, 8], [8, 2], [0, 6], [10, 0], [10, 0], [10, 8, 1]]
  end
end