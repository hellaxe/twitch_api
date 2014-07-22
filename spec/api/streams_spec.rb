require 'spec_helper'

describe TwitchApi::Api::Streams do
  before :each do
      @client = TwitchApi::Client.new({ access_token: ENV['TWITCH_ACCESS_TOKEN']})
  end

  it "gets stream by channel", vcr: true do
    expect(@client.get_stream('dexter_bl')[:status_code]).to eq(200)
  end

  it "gets streams by query params", vcr: true do
    limit = 2
    response = @client.get_streams({query: {game: 'Minecraft', limit: limit}})
    expect(response[:status_code]).to eq(200)
    expect(response[:streams].count).to eq(limit)
  end

  it "gets featured streams", vcr: true do
    expect(@client.get_featured_streams[:status_code]).to eq(200)
  end

  it "gets summary streams", vcr: true do
    expect(@client.get_summary_streams[:status_code]).to eq(200)
  end

end
