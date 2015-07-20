require 'breachalarm/client'
require 'breachalarm/default'

# Ruby toolkit for the BreachAlarm API
module BreachAlarm
  class << self
    include BreachAlarm::Configurable

    # API client based on configured options {Configurable}
    #
    # @return [BreachAlarm::Client] API wrapper
    def client
      return @client if defined?(@client) && @client.same_options?(options)
      @client = BreachAlarm::Client.new(options)
    end # def client

    private

    def respond_to_missing?(method_name, include_private=false)
      client.respond_to?(method_name, include_private)
    end # def respond_to_missing

    def method_missing(method_name, *args, &block)
      if client.respond_to?(method_name)
        return client.send(method_name, *args, &block)
      end

      super
    end # def method_missing

  end # class self
end # module BreachAlarm

BreachAlarm.setup
