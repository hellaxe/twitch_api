module TwitchApi
  module Api
    module Subscriptions
      def get_channel_subscriptions(channel, options = {})
        path = "#{BASE_URL}/channels/#{channel}/subscriptions"
        get(path, options)
      end

      def get_channel_subscription(channel, user, options = {})
        path = "#{BASE_URL}/channels/#{channel}/subscriptions/#{user}"
        get(path, options)
      end

      def check_user_subscription(channel, user, options = {})
        path = "#{BASE_URL}/users/#{user}/subscriptions/#{channel}"
        get(path, options)
      end
    end
  end
end
