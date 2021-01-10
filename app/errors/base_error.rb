class BaseError < StandardError
    attr_reader :code

    def initialize(message = nil, code: nil)
      @code = code
      super(message)
    end

    def self.coded(code = nil)
      new("Error with code: #{code}", code: code)
    end
end
