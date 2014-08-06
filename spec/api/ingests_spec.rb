require 'spec_helper'

describe TwitchApi::Api::Ingests do
  before :each do
    @client = TwitchApi::Client.new
  end

  it "gets ingests", vcr: true do
    expect(@client.get_ingests[:status_code]).to eq(200)
  end
end
