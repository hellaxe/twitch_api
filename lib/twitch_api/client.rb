require 'json'
module TwitchApi
  class Client
    include QueryHelper
    include Api::RequestHelper
    include Api::Channels
    include Api::Games
    include Api::Search
    include Api::Blocks

    attr_reader :secret_key, :client_id, :connected, :access_token, :scopes
    # TODO: make options hash in params
    def initialize(options = {})
      @client_id = options.delete(:client_id) || TwitchApi.client_id
      @secret_key = options.delete(:secret_key) || TwitchApi.secret_key 
      @access_token = options.delete(:access_token) || nil
      @scopes = options.delete(:scopes) || %w(user_read channel_read)
    end

    # TODO: refactor
    def auth_url()
      scope = @scopes.join '+'
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
      response = post(path, {data: data})
      @access_token = response[:access_token]
      response
    end
  end
end
