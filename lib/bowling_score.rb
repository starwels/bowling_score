#!/usr/bin/ruby -w

require 'csv'

require_relative 'bowling_score/frames'
require_relative 'bowling_score/file_parser'
require_relative 'bowling_score/helpers'
require_relative 'bowling_score/main'
require_relative 'bowling_score/pinfalls'
require_relative 'bowling_score/player'
require_relative 'bowling_score/result'
require_relative 'bowling_score/score'
require_relative 'bowling_score/validator'

module BowlingScore
  case
  when ARGV.empty?; puts 'Bowling Score needs a txt file as argument'; exit
  else FILE = ARGV[0]
  end

  Main.new(file: FILE).run
end