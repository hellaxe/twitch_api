require 'spec_helper'

describe TwitchApi::Api::Blocks do
  before :each do
    @client = TwitchApi::Client.new({access_token: ENV['TWITCH_ACCESS_TOKEN']})
  end

  it 'gets block list', vcr: true do
    result = @client.get_block_list('Dodgello')
    result.should be_instance_of(Hash)
  end

  it 'adds target to a block list', vcr: true do
    result = @client.add_block('Dodgello', 'SomeUser')
    result.should be_instance_of(Hash)
  end

  it 'deletes target from a block list', vcr: true do
    result = @client.remove_block('Dodgello', 'SomeUser')
    expect(result).to eq(nil)
  end
end
