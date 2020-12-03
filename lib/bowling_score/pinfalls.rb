module BowlingScore
  class Pinfalls
    attr_reader :values

    def initialize(frames:)
      @frames = frames
      @values = Array.new
    end

    def generate
      @frames.each_with_index do |(roll_1, roll_2), index|
        @current_index = index

        if last_frame?
          pinfalls_last_frame
          break
        end

        if strike?
          @values << "" << STRIKE
        elsif spare?
          @values << roll_1.to_s << SPARE
        else
          @values << roll_1.to_s << roll_2.to_s
        end
      end
    end

    private

    def pinfalls_last_frame
      if last_frame_spare?
        @values << @frames[@current_index].first << SPARE
      end

      @values << @frames[@current_index].collect { |value| value == 10 ? STRIKE : value.to_s }
      @values.flatten!
    end

    def last_frame?
      @current_index == 9
    end

    def strike?
      @frames[@current_index].first == 10
    end

    def spare?
      @frames[@current_index].sum == 10
    end

    def last_frame_spare?
      @frames[@current_index].first(2).sum == 10
    end
  end
end