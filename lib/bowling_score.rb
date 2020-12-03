#!/usr/bin/ruby -w

require 'csv'

require_relative 'bowling_score/file_parser'
require_relative 'bowling_score/pinfalls'
require_relative 'bowling_score/player'
require_relative 'bowling_score/result'
require_relative 'bowling_score/score'
require_relative 'bowling_score/validator'

module BowlingScore
  TAB_SEPARATOR = "\t"
  NEW_LINE = "\n"

  STRIKE = 'X'
  SPARE = '/'

  case
  when ARGV.empty?; puts 'Bowling Score needs a txt file as argument'
  else @file = ARGV[0]
  end

  file_parsed_content = FileParser.new(file: @file)
  grouped_rolls_by_player = file_parsed_content.group_rolls_by_player

  grouped_rolls_by_player.each do |player_name, rolls|
    Player.new(name: player_name, rolls: rolls)
  end
end