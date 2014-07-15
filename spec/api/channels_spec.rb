require 'spec_helper'

describe TwitchApi::Api::Channels do
  
  describe "Authorized" do
    before :each do
      @client = TwitchApi::Client.new({ access_token: ENV['TWITCH_ACCESS_TOKEN']})
    end

    it "gets your channel", vcr: true do
        expect(@client.get_channel[:status_code]).to eq(200)
    end

    it "gets channel editors", vcr: true do
      expect(@client.get_channel_editors({channel: 'dodgello'})[:status_code]).to eq(200)
    end

  end

  describe "Unauthorized" do
    before :each do
      @client = TwitchApi::Client.new
    end

    it "raises error when channel is not specified", vcr: true do
        expect(@client.get_channel[:status_code]).to eq(401)
    end

    it "gets specified channel", vcr: true  do
        expect(@client.get_channel({channel: 'dodgello'})[:status_code]).to eq(200)
    end

    it "raises error on getting channel editors", vcr: true do
      expect( @client.get_channel_editors({channel: 'dodgello'})[:status_code] ).to eq(401)
    end
  end
end
