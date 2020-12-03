module BowlingScore
  class Frames
    attr_reader :values

    def initialize(rolls:)
      @rolls = rolls
      @values = Array.new
      @current_index = 0
    end

    def generate
      skip_iteration = false

      @rolls.each_cons(2) do |roll_1, roll_2|
        if last_frame?
          fill_last_frame(roll_1: roll_1, roll_2: roll_2)
          break
        end

        if skip_iteration
          skip_iteration = false
          next
        end

        if strike?(value: roll_1)
          fill_strike_frame
        else
          skip_iteration = true
          @values << [roll_1, roll_2]
        end
      end
    end

    private

    def fill_strike_frame
      @values << [10, 0]
    end

    def fill_last_frame(roll_1:, roll_2:)
      @values << if strike?(value: roll_1) || spare?(roll_1: roll_1, roll_2: roll_2)
                   @rolls[-3..]
                 else
                   @rolls[-2..] << 0
                 end
    end

    def strike?(value:)
      value == 10
    end

    def spare?(roll_1:, roll_2:)
      roll_1 + roll_2 == 10
    end

    def last_frame?
      @values.size == 9
    end
  end
end