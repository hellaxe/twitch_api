module TwitchApi
  module Api
    module Chat
      def get_chat_links(channel, options = {})
        path = "#{BASE_URL}/chat/#{channel}"
        get(path, options)
      end

      def get_chat_emoticons(channel = "", options = {})
        if channel.empty?
          path = "#{BASE_URL}/chat/emoticons"
        else
          path = "#{BASE_URL}/chat/#{channel}/emoticons"
        end
        get(path, options)
      end
    end
  end
end
