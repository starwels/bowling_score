module BowlingScore
  class Player
    attr_reader :name, :frames, :pinfalls, :score

    def initialize(name:, frames:, pinfalls:, score:)
      @name = name
      @frames = frames
      @pinfalls = pinfalls
      @score = score
    end
  end
end