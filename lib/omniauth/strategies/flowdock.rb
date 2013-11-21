require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Flowdock < OmniAuth::Strategies::OAuth2
      option :name, :flowdock

      option :client_options, {
        site: "https://api.flowdock.com",
        authorize_url: "/oauth/authorize"
      }

      option :scope, 'profile'

      uid { raw_info["id"].to_s }

      info do
        {
          email: raw_info["email"],
          name: raw_info["name"],
          nickname: raw_info["nick"]
        }
      end

      def raw_info
        @raw_info ||= access_token.get('user').parsed
      end
    end
  end
end
