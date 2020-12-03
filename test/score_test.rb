require 'test/unit'

require_relative '../lib/bowling_score/score'

class ScoreTest < Test::Unit::TestCase
  include BowlingScore

  def setup
    @score = Score.new(frames: valid_input)
  end

  def test_fill
    assert_equal(expected_output, @score.values)
  end

  private

  def valid_input
    [[10, 0], [7, 3], [9, 0], [10, 0], [0, 8], [8, 2], [0, 6], [10, 0], [10, 0], [10, 8, 1]]
  end

  def expected_output
    [20, 39, 48, 66, 74, 84, 90, 120, 148, 167]
  end
end