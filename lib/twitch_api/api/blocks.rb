module TwitchApi
  module Api
    module Blocks
      def get_block_list(user, options = {})
        path = "#{BASE_URL}/users/#{user}/blocks"
        get(path, options)
      end
      def add_block(user, target, options = {})
        path = "#{BASE_URL}/users/#{user}/blocks/#{target}"
        put(path, options)
      end

      def remove_block(user, target, options = {})
        path = "#{BASE_URL}/users/#{user}/blocks/#{target}"
        delete(path, options)
      end
    end
  end
end
