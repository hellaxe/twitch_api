require 'spec_helper'

describe TwitchApi::Api::Channels do
  
  describe "Authorized" do
    before :each do
      @client = TwitchApi::Client.new({ access_token: 'ip8tlw1i2i3r80dm5902f6q2werfcf'})
    end

    it "gets your channel", vcr: true do
        @client.get_channel.should be_instance_of(Hash)
    end

    it "gets channel editors", vcr: true do
      @client.get_channel_editors({channel: 'dodgello'}).should be_instance_of(Hash)
    end

  end

  describe "Unauthorized" do
    before :each do
      @client = TwitchApi::Client.new
    end

    it "raises error when channel is not specified", vcr: true do
        expect{@client.get_channel}.to raise_error(TwitchApi::Errors::UnauthorizedError)
    end

    it "gets specified channel", vcr: true  do
        @client.get_channel({channel: 'dodgello'}).should be_instance_of(Hash)
    end

    it "raises error on getting channel editors", vcr: true do
      expect{@client.get_channel_editors({channel: 'dodgello'})}.to raise_error(TwitchApi::Errors::UnauthorizedError)
    end
  end
end
