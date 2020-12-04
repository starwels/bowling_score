require 'test/unit'
require 'csv'

require_relative '../../lib/bowling_score/main'

class MainTest < Test::Unit::TestCase
  include BowlingScore

  def setup
    @valid_input = 'input.txt'
  end

  def test_valid_input
    assert_equal(expected_valid_output, Main.new(file: 'input.txt').run)
  end

  def test_only_strike
    assert_equal(expected_only_strikes, Main.new(file: 'only_strikes.txt').run)
  end

  def test_invalid_input
    assert_raise( InvalidValue ) { Main.new(file: 'invalid_input.txt').run }
  end

  private

  def expected_valid_output
    <<-STRING
Frame\t\t1\t\t2\t\t3\t\t4\t\t5\t\t6\t\t7\t\t8\t\t9\t\t10\t\t
Jeff
Pinfalls\t\tX\t7\t/\t9\t0\t\tX\t0\t8\t8\t/\t0\t6\t\tX\t\tX\tX\t8\t1\t
Score\t\t20\t\t39\t\t48\t\t66\t\t74\t\t84\t\t90\t\t120\t\t148\t\t167\t\t
John
Pinfalls\t3\t/\t6\t3\t\tX\t8\t1\t\tX\t\tX\t9\t0\t7\t/\t4\t4\t9\t0\t0\t
Score\t\t16\t\t25\t\t44\t\t53\t\t82\t\t101\t\t110\t\t124\t\t132\t\t141\t\t
   STRING
  end

  def expected_only_strikes
    <<-STRING
Frame\t\t1\t\t2\t\t3\t\t4\t\t5\t\t6\t\t7\t\t8\t\t9\t\t10\t\t
Xunda
Pinfalls\t\tX\t\tX\t\tX\t\tX\t\tX\t\tX\t\tX\t\tX\t\tX\tX\tX\tX\t
Score\t\t30\t\t60\t\t90\t\t120\t\t150\t\t180\t\t210\t\t240\t\t270\t\t300\t\t
    STRING
  end
end