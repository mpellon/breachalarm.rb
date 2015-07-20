module BreachAlarm

  # Configuration options for {Client}, defaulting to values
  # in {Default}
  module Configurable
    # @!attribute api_endpoint
    #   @return [String] Base URL for API requests. default: https://breachalarm.com/api/v1/
    # @!attribute api_key
    #   @see https://breachalarm.com/api#api_keys
    #   @return [String] Configure the api key

    attr_accessor :api_key
    attr_writer   :api_endpoint

    class << self

      # List of configurable keys for {BreachAlarm::Client}
      # @return [Array] of option keys
      def keys
        @keys ||= [
          :api_endpoint,
          :api_key
        ]
      end # def keys
    end # class self

    # Set configuration options using a block
    def configure
      yield self
    end # def configure

    # Reset configuration options to default values
    def reset!
      BreachAlarm::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", BreachAlarm::Default.options[key])
      end
      self
    end # def reset!
    alias setup reset!

    # Compares client options to a Hash of requested options
    #
    # @param opts [Hash] Options to compare with current client options
    # @return [Boolean]
    def same_options?(opts)
      opts.hash == options.hash
    end # def same_options?

    def api_endpoint
      File.join(@api_endpoint, "")
    end # def api_endpoint

    private

    def options
      Hash[BreachAlarm::Configurable.keys.map{|key| [key, instance_variable_get(:"@#{key}")]}]
    end

  end # module Configurable
end # module BreachAlarm
