require 'spec_helper'

describe TwitchApi::Api::Subscriptions do
  before :each do
      @client = TwitchApi::Client.new({ access_token: ENV['TWITCH_ACCESS_TOKEN']})
  end

  # bad tests

  it "gets channel subscriptions", vcr: true do
    result = @client.get_channel_subscriptions('dodgello', {query: {limit: 5}})
    expect(result[:status_code]).to eq(422)
  end

  it "gets subscription if channel has user subscribed", vcr: true do
    result = @client.get_channel_subscription('dodgello', 'someuser')
    expect(result[:status_code]).to eq(422)
  end

  it "gets channel if user subscribed to", vcr: true do
    result = @client.check_user_subscription('dodgello', 'someuser')
    expect(result[:status_code]).to eq(422)
  end
end
