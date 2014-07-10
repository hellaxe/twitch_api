require 'json'
module TwitchApi
  class Client
    include QueryHelper
    include Api::RequestHelper
    include Api::Channels
    include Api::Games

    attr_reader :secret_key, :client_id, :connected, :access_token
    # TODO: make options hash in params
    def initialize(access_token = nil, secret_key = TwitchApi.secret_key, 
                   client_id = TwitchApi.client_id)
      @secret_key, @client_id = secret_key, client_id
      @access_token = access_token
    end

    # TODO: refactor
    def auth_url()
      scope = ["user_read", "channel_read"].join('+')
      "https://api.twitch.tv/kraken/oauth2/authorize?response_type=code&client_id=#{@client_id}&redirect_uri=http://localhost:3000&scope=#{scope}"
    end

    # TODO: move to auth.rb
    def request_token(code)
      path = "https://api.twitch.tv/kraken/oauth2/token"
      data = {
        client_id: @client_id,
        client_secret: @secret_key,
        grant_type: "authorization_code",
        redirect_uri: 'http://localhost:3000',
        code: code

      }
      response = post(path, data)
      @access_token = response[:access_token]
      response
    end
  end
end
