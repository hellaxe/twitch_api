module TwitchApi
  module Api

    module Channels
      def get_channel(options = {}) 
        channel = options.delete :channel
        if channel.nil? || channel.empty?
          path = "#{BASE_URL}/channel"
        else
          path = "#{BASE_URL}/channels/#{channel}"
        end
        get(path, options)
      end
      
      def get_channel_editors(options = {})
        channel = options.delete :channel
        path = "#{BASE_URL}/channels/#{channel}/editors"
        get(path, options)
      end

    end
  end
end
