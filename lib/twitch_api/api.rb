require 'curb'
module TwitchApi
  module Api
    BASE_URL = 'https://api.twitch.tv/kraken'
    require 'twitch_api/api/request_helper'
    require 'twitch_api/api/channels'
    require 'twitch_api/api/games'
  end
end
