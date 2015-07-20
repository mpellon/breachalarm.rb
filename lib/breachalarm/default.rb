require 'breachalarm/version'

module BreachAlarm

  # Default configuration options for {Client}
  module Default

    # Default API endpoint
    API_ENDPOINT = "https://breachalarm.com/api/v1/".freeze

    # Default User Agent header string
    USER_AGENT   = "BreachAlarm Ruby Gem #{BreachAlarm::VERSION}".freeze

    class << self

      # Configuration options
      # return [Hash]
      def options
        Hash[BreachAlarm::Configurable.keys.map{|key| [key, send(key)]}]
      end

      # Default API endpoint from ENV or {API_ENDPOINT}
      # @return [String]
      def api_endpoint
        ENV['BREACHALARM_API_ENDPOINT'] || API_ENDPOINT
      end # def api_endpoint

      # Default api key from ENV
      # @return [String]
      def api_key
        ENV['BREACHALARM_API_KEY']
      end # def api_key

      # Default options for Faraday::Connection
      # @return [Hash]
      def connection_options
        {
          :headers => {
            :api_key => api_key,
            :user_agent => user_agent
          }
        }
      end # def connection_options

      # Default User-Agent header string from ENV or {USER_AGENT}
      # @return [String]
      def user_agent
        ENV['BREACHALARM_USER_AGENT'] || USER_AGENT
      end # def user_agent

    end # class self
  end # module Default
end # module BreachAlarm
