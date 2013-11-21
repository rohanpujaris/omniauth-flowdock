require 'spec_helper'


describe OmniAuth::Strategies::Flowdock do
  let(:access_token) { double('AccessToken', options: {}) }
  let(:request) { double('Request', params: {}, cookies: {}, env: {}) }
  let(:parsed_response) { double('ParsedResponse') }
  let(:response) { double('Response', parsed: parsed_response) }

  subject do
    args = ['client-id', 'client-secret', {}].compact
    OmniAuth::Strategies::Flowdock.new(*args).tap do |strategy|
      allow(strategy).to receive(:request).and_return(request)
    end
  end

  describe 'client options' do
    it 'has correct name' do
      expect(subject.options.name).to eq(:flowdock)
    end

    it 'has correct site' do
      expect(subject.options.client_options.site).to eq('https://api.flowdock.com')
    end

    it 'has correct authorize url' do
      expect(subject.options.client_options.authorize_url).to eq('/oauth/authorize')
    end
  end

  describe '#uid' do
    before do
      allow(subject).to receive(:raw_info).and_return({'id' => 123 })
    end

    it "stringifies user id" do
      expect(subject.uid).to eq("123")
    end
  end

  describe '#user_info' do
    before do
      allow(subject).to receive(:raw_info).and_return(
        {
          'name' => 'John Doe',
          'email' => 'jdoe@example.com',
          'nick' => 'John'
        }
      )
    end

    it 'has name' do
      expect(subject.info[:name]).to eq('John Doe')
    end

    it 'has nickname' do
      expect(subject.info[:nickname]).to eq('John')
    end

    it 'has email' do
      expect(subject.info[:email]).to eq('jdoe@example.com')
    end
  end

  context "#raw_info" do
    it "requests raw info from /user" do
      allow(subject).to receive(:access_token).and_return(access_token)
      access_token.should_receive(:get).with('user').and_return(response)
      expect(subject.raw_info).to eq(parsed_response)
    end
  end

  describe '#authorize_params' do
    before :each do
      allow(subject).to receive(:session).and_return({})
    end

    it 'sets default scope' do
      expect(subject.authorize_params['scope']).to eq('profile')
    end
  end
end
