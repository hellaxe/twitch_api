require 'spec_helper'

describe TwitchApi::Api::Users do
  before :each do
      @client = TwitchApi::Client.new({ access_token: ENV['TWITCH_ACCESS_TOKEN']})
  end

  it "gets specified user", vcr: true do
    result = @client.get_user('dodgello')
    expect(result[:status_code]).to eq(200)
  end

  it "gets self user", vcr: true do
    result = @client.get_user
    expect(result[:status_code]).to eq(200)
  end

  it "gets followed videos", vcr: true do
    result = @client.get_followed_videos
    expect(result[:status_code]).to eq(200)
  end

end
