module BowlingScore
  class Result
    TAB_SEPARATOR = "\t"
    NEW_LINE = "\n"

    def initialize(players:)
      @players = players
    end

    def generate_output
      generate_frames

      @players.each do |player|
        pinfalls = player.pinfalls
        score = player.score

        pinfalls.generate
        score.generate

        @output << player.name << NEW_LINE
        @output << 'Pinfalls' << TAB_SEPARATOR << pinfalls.formatted_values << NEW_LINE
        @output << 'Score' << TAB_SEPARATOR << TAB_SEPARATOR << score.formatted_values << NEW_LINE
      end

      puts @output
      @output
    end

    private

    def generate_frames
      @output = "Frame" << TAB_SEPARATOR << TAB_SEPARATOR
      (1..10).each do |column|
        @output << column.to_s << TAB_SEPARATOR << TAB_SEPARATOR
      end
      @output << NEW_LINE
    end
  end
end