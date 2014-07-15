module TwitchApi
  require 'pry'
  require 'twitch_api/version' 
  require 'twitch_api/errors'
  require 'twitch_api/query_helper'
  require 'twitch_api/api'
  require 'twitch_api/client'

  ALL_SCOPES = %w(user_read user_blocks_edit user_blocks_read user_follows_edit channel_read channel_editor channel_commercial channel_stream channel_subscriptions user_subscriptions channel_check_subscription chat_login)

  def self.secret_key
    ENV['TWITCH_SECRET_KEY'] || 'SECRET'
  end

  def self.client_id
    ENV['TWITCH_CLIENT_ID'] || 'SECRET' 
  end
end
