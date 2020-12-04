require_relative 'helpers'

module BowlingScore
  class Frames
    include Helpers
    
    attr_reader :values

    def initialize(rolls:)
      @rolls = rolls
      @values = Array.new
      @current_index = 0
    end

    def generate
      @skip_iteration = false

      @frames = @rolls.each_cons(2).to_a

      @frames.each_with_index do |_, index|
        @current_index = index

        if last_frame?
          fill_last_frame
          break
        end

        if @skip_iteration
          @skip_iteration = false
          next
        end

        if strike?
          fill_strike_frame
        else
          fill_frame
        end
      end
    end

    private

    def fill_strike_frame
      @values << [10, 0]
    end

    def fill_frame
      @skip_iteration = true
      @values << @frames[@current_index]
    end

    def fill_last_frame
      @values << if strike? || spare?
                   @rolls[-3..]
                 else
                   @rolls[-2..] << 0
                 end
    end

    def last_frame?
      @values.size == 9
    end
  end
end