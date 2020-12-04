module BowlingScore
  module Helpers
    STRIKE = 'X'
    SPARE = '/'

    def last_frame?
      @current_index == 9
    end

    def strike?
      @frames[@current_index].first == 10
    end

    def spare?
      @frames[@current_index].sum == 10
    end

    def format
      temp = []
      @values.each do |values|
        temp << values << self.class::TAB_SEPARATOR
      end

      @formatted_values = temp.join
    end
  end
end