require_relative 'file_parser'
require_relative 'validator'
require_relative 'frames'
require_relative 'pinfalls'
require_relative 'score'
require_relative 'player'
require_relative 'result'

module BowlingScore
  class Main
    def initialize(file:)
      @file = file
    end
    
    def run
      setup

      players = @grouped_rolls_by_player.map do |player_name, rolls|
        Validator.new(values: rolls).call

        frames = Frames.new(rolls: rolls)
        frames.generate

        pinfalls = Pinfalls.new(frames: frames.values)

        score = Score.new(frames: frames.values)

        Player.new(name: player_name, frames: frames, pinfalls: pinfalls, score: score)
      end

      Result.new(players: players).generate_output
    end

    private

    def setup
      file_parsed_content = FileParser.new(file: @file)

      @grouped_rolls_by_player = file_parsed_content.group_rolls_by_player
    end
  end
end