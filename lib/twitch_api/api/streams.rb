module TwitchApi
  module Api
    module Streams
      def get_stream(channel, options = {})
        path  = "#{BASE_URL}/streams/#{channel}"
        get(path, options)
      end

      def get_streams(options = {})
        path = "#{BASE_URL}/streams"
        get(path, options)
      end

      def get_featured_streams(options = {})
        path = "#{BASE_URL}/streams/featured"
        get(path, options)
      end

      def get_summary_streams(options = {})
        path = "#{BASE_URL}/streams/summary"
        get(path, options) 
      end
    end
  end
end
