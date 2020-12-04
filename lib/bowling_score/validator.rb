module BowlingScore
  class InvalidValue < StandardError
    def initialize(msg = "Values must be between 0 and 10")
      super
    end
  end

  class InvalidThrowsLength < StandardError
    def initialize(msg = "Rolls must be between 20 and 21")
      super
    end
  end

  class Validator
    def initialize(values:)
      @values = values
    end

    def call
      validate_values
      validate_rolls
    end

    private

    def validate_values
      @values.each do |value|
        raise InvalidValue if !value.between?(0, 10)
      end
    end

    def validate_rolls
      raise InvalidThrowsLength if !@values.size.between?(12,21)
    end
  end
end