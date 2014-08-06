module TwitchApi
  module Api
    module Ingests
      def get_ingests(options = {})
        path = "#{BASE_URL}/ingests"
        get(path, options)
      end
    end
  end
end
