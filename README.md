# OmniAuth Flowdock Strategy [![Build Status](https://travis-ci.org/flowdock/omniauth-flowdock.png)](https://travis-ci.org/flowdock/omniauth-flowdock)

Flowdock OAuth 2.0 Strategy for OmniAuth.

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-flowdock'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-flowdock

## Usage

You should have already installed OmniAuth into your app; if not, read the
[OmniAuth README](https://github.com/intridea/omniauth) to get started.

Then, you need to [create an Flowdock OAuth 2.0 application](https://www.flowdock.com/account/authorized_applications).
The application ID and consumer secret are needed. Ensure that your callback URL
is properly configured, e.g. `https://example.com/auth/flowdock/callback`.

Then, register the Flowdock provider. For example, your
`config/initializers/omniauth.rb` might look like following:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :flowdock, ENV['FLOWDOCK_CLIENT_ID'], ENV['FLOWDOCK_CLIENT_SECRET']
end
```

If you need more access than just user profile, change the scope field accordingly.
For example, to post to user's flows

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :flowdock, ENV['FLOWDOCK_CLIENT_ID'], ENV['FLOWDOCK_CLIENT_SECRET'], scope: 'flow'
end
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
