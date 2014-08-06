require 'spec_helper'

describe TwitchApi::Api::Teams do
  before :each do
      @client = TwitchApi::Client.new
  end

  it "gets teams", vcr: true do
    result = @client.get_teams
    expect(result[:status_code]).to eq(200)
  end

  it "gets team", vcr: true do
    result = @client.get_team('bloodlegion')
    expect(result[:status_code]).to eq(200)
  end
end
