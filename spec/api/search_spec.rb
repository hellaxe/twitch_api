require 'spec_helper'

describe TwitchApi::Api::Search do
  before :each do
    @client = TwitchApi::Client.new
    @opts = {query: {q: 'test', limit: 10}}
  end

  it "searches channels", vcr: true do
    @client.search_channels(@opts).should be_instance_of(Hash)
  end

  it "searches streams", vcr: true do
    @client.search_streams(@opts).should be_instance_of(Hash)
  end

  it "searches games", vcr: true do
    @client.search_games({query: {q: 'star', type: 'suggest', limit: 10}}).should be_instance_of(Hash)
  end
end
