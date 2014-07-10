module TwitchApi
  module Errors
    class TwitchApiError < StandardError

    end

    class UnauthorizedError < TwitchApiError

    end
  end
end
