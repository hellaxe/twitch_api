require 'spec_helper'

describe TwitchApi::Api::Games do
  before :each do
    @client = TwitchApi::Client.new
  end

  it "gets games top", vcr: true do
    @client.get_games_top.should be_instance_of(Hash)
  end

  it "gets games by limit", vcr: true do
    result = @client.get_games_top(query: {limit: 10})
    result.should be_instance_of(Hash)
    result[:top].count.should be_equal(10)
  end
end
