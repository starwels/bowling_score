require 'test/unit'

require_relative '../../lib/bowling_score/score'

class ScoreTest < Test::Unit::TestCase
  include BowlingScore

  def setup
    @score = Score.new(frames: valid_input)
  end

  def test_fill
    @score.generate
    assert_equal(expected_output, @score.formatted_values)
  end

  private

  def valid_input
    [[10, 0], [7, 3], [9, 0], [10, 0], [0, 8], [8, 2], [0, 6], [10, 0], [10, 0], [10, 8, 1]]
  end

  def expected_output
    "20\t\t39\t\t48\t\t66\t\t74\t\t84\t\t90\t\t120\t\t148\t\t167\t\t"
  end
end