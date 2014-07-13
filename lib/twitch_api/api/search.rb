module TwitchApi
  module Api
    module Search
      def search_channels(options = {})
        path = "#{BASE_URL}/search/channels"
        path += build_query_string(options[:query])
        get(path, options)
      end
      def search_streams(options = {})
        path = "#{BASE_URL}/search/streams"
        path += build_query_string(options[:query])
        get(path, options)
      end
      def search_games(options={})
        path = "#{BASE_URL}/search/games"
        path += build_query_string(options[:query])
        get(path, options)
      end
    end
  end
end
