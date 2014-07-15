module TwitchApi
  module Api
    module Follows
      def get_channel_followers(channel, options = {})
        path = "#{BASE_URL}/channels/#{channel}/follows"
        get(path, options)
      end

      def get_followed_channels(user, options = {})
        path = "#{BASE_URL}/users/#{user}/follows/channels"
        get(path, options)
      end

      def get_follow_relationship(user, channel, options = {})
        path = "#{BASE_URL}/users/#{user}/follows/channels/#{channel}"
        get(path, options)
      end

      def follow_channel(user, channel, options = {})
        path = "#{BASE_URL}/users/#{user}/follows/channels/#{channel}"
        put(path, options)
      end

      def unfollow_channel(user, channel, options = {})
        path = "#{BASE_URL}/users/#{user}/follows/channels/#{channel}"
        delete(path, options)
      end

      def get_followed_streams(options = {})
        path = "#{BASE_URL}/streams/followed"
        get(path, options)
      end
    end
  end
end
