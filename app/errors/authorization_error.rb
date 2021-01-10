
  class AuthorizationError < BaseError
    def initialize
      super(AuthorizationError, code: 401)
    end
  end

