require 'breachalarm/configurable'

module BreachAlarm

  # Client for the BreachAlarm API
  #
  # @see https://breachalarm.com/api
  class Client

    include BreachAlarm::Configurable

    def initialize(options = {})
      # Use options passed in, but fall back to module defaults
      BreachAlarm::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", options[key] || BreachAlarm.instance_variable_get(:"@#{key}"))
      end
    end # def initialize

  end # class Client

end # module BreachAlarm
