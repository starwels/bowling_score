require_relative 'helpers'

module BowlingScore
  class Score
    include Helpers

    attr_reader :values

    def initialize(frames:)
      @frames = frames
      @values = []
    end

    def generate
      @frames.each_with_index do |_, index|
        @current_index = index

        if last_frame?
          score_frame
          break
        end

        case
        when strike?;
          score_strike
        when spare?;
          score_spare
        else
          score_frame
        end
      end
    end

    private

    def next_frame_strike?
      @frames[@current_index + 1].first == 10
    end

    def score_strike
      @values << if next_frame_strike?
                  @frames[@current_index..@current_index + 2]
                else
                  @frames[@current_index..@current_index + 1]
                end.flatten
                    .delete_if(&:zero?)[0..2]
                    .push(@values[@current_index - 1])
                    .compact
                    .sum
    end

    def score_spare
      @values << [@frames[@current_index], @frames[@current_index + 1].first]
                     .push(@values[@current_index - 1])
                     .flatten
                     .compact
                     .sum
    end

    def score_frame
      @values << @frames[@current_index].sum + @values[@current_index - 1]
    end
  end
end