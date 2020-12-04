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
  end
end