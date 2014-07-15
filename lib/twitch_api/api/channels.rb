module TwitchApi
  module Api

    module Channels
      def get_channel(channel = "", options = {}) 
        if channel.nil? || channel.empty?
          path = "#{BASE_URL}/channel"
        else
          path = "#{BASE_URL}/channels/#{channel}"
        end
        get(path, options)
      end
      
      def get_channel_editors(channel, options = {})
        path = "#{BASE_URL}/channels/#{channel}/editors"
        get(path, options)
      end

      def update_channel(channel, options = {})
        path = "#{BASE_URL}/channels/#{channel}"
        put(path, options)
      end

      def reset_channel_stream_key(channel, options = {})
        path = "#{BASE_URL}/channels/#{channel}/stream_key"
        delete(path, options)
      end

      def start_commercial(channel, options = {})
        path = "#{BASE_URL}/channels/#{channel}/commercial"
        post(path, options)
      end
    end
  end
end
