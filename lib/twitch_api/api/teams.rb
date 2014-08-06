module TwitchApi
  module Api
    module Teams
      def get_teams(options = {})
        path = "#{BASE_URL}/teams/"
        get(path, options)
      end

      def get_team(team, options = {})
        path = "#{BASE_URL}/teams/#{team}"
        get(path, options)
      end
    end
  end
end
