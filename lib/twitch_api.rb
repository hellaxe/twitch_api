module TwitchApi
  require 'pry'
  require 'twitch_api/version' 
  require 'twitch_api/errors'
  require 'twitch_api/query_helper'
  require 'twitch_api/api'
  require 'twitch_api/client'

  def self.secret_key
    ENV['TWITCH_SECRET_KEY'] || 'SECRET'
  end

  def self.client_id
    ENV['TWITCH_CLIENT_ID'] || 'SECRET' 
  end
end
