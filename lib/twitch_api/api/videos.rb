module TwitchApi
  module Api
    module Videos

      def get_channel_videos(channel, options = {})
        path = "#{BASE_URL}/channels/#{channel}/videos"
        get(path, options)
      end

    end
  end
end
