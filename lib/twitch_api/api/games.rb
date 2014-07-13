module TwitchApi
  module Api
    module Games
      GAMES_OPTS_WHITE_LIST = [:limit, :offset, :hls]
      def get_games_top(options = {})
        path = "#{BASE_URL}/games/top"
        get(path, options)
      end
    end
  end
end
