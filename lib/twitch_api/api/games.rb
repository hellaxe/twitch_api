module TwitchApi
  module Api
    module Games
      GAMES_OPTS_WHITE_LIST = [:limit, :offset, :hls]
      def get_games_top(options = {})
        path = "#{BASE_URL}/games/top"
        whitelist_options = filter_hash(GAMES_OPTS_WHITE_LIST, options)
        path += build_query_string(whitelist_options)
        get(path, options)
      end
    end
  end
end
