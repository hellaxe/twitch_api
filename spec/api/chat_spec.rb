require 'spec_helper'

describe TwitchApi::Api::Chat do
  before :each do
    @client = TwitchApi::Client.new
  end

  it 'gets chat links', vcr: true do
    expect(@client.get_chat_links('dodgello')[:status_code]).to eq(200)
  end

  it 'gets chat emoticons', vcr: true do 
    expect(@client.get_chat_emoticons('dodgello')[:status_code]).to eq(200)
  end
end
