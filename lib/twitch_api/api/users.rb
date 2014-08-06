module TwitchApi
  module Api
    module Users
      def get_user(user = "", options = {})
        if user.empty?
          path = "#{BASE_URL}/user"
        else
          path = "#{BASE_URL}/users/#{user}"
        end
        get(path, options)
      end 

      def get_followed_videos(options = {})
        path = "#{BASE_URL}/videos/followed"
        get(path, options)
      end
    end
  end
end
