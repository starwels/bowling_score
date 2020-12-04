module BowlingScore
  class FileParser
    def initialize(file:)
      @file_content = CSV.read(file)
    end

    def group_rolls_by_player
      @file_content.flatten
          .map(&:split)
          .group_by(&:first)
          .map { |k, v| [k, replace_foul(values: v.map(&:last)).map(&:to_i)] }
          .to_h
    end

    private

    def replace_foul(values:)
      values.collect { |value| value == 'F' ? 0 : value }
    end
  end
end