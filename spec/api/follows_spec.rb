require 'spec_helper'

describe TwitchApi::Api::Follows do
  before :each do
    @client = TwitchApi::Client.new({access_token: ENV['TWITCH_ACCESS_TOKEN']})
  end

  it 'gets channel\'s followers', vcr: true do
    result = @client.get_channel_followers('edynlol')
    expect(result[:status_code] ).to eq(200)
  end
  it 'gets user\'s followed channels', vcr: true do
    expect( @client.get_followed_channels('Dodgello')[:status_code] ).to eq(200)
  end
  it 'gets status of relation between user and channel', vcr: true do
    expect( @client.get_follow_relationship('Dodgello', 'hashinshin')[:status_code] ).to eq(200)
  end
  it 'follows a channel', vcr: true do
    expect( @client.follow_channel('Dodgello', 'Czaru')[:status_code] ).to eq(200)
  end
  it 'unfollow a channel', vcr: true do
    expect( @client.unfollow_channel('Dodgello', 'Czaru')[:status_code] ).to eq(204)
  end
  it 'gets a followed streams', vcr: true do
    expect( @client.get_followed_streams[:status_code] ).to eq(200)
  end
end
