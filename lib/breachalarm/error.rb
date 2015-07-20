module BreachAlarm
  # Custom error class for rescuing from all BreachAlarm API errors
  class Error < StandardEroor

    # Returns the appropriate BreachAlarm::Error subclass based on status
    # and response message
    #
    # @see https://breachalarm.com/api#responsestatuscodes
    # @param [Hash] response HTTP response
    # @return [BreachAlarm::Error]
    def self.from_response(response)
      status  = response[:status].to_i
      body    = response[:body].to_s
      headers = response[:response_headers]

      if klass = case status
                 when 400      then BreachAlarm::BadRequest
                 when 401      then BreachAlarm::Unauthorized
                 when 403      then BreachAlarm::Forbidden
                 when 404      then BreachAlarm::NotFound
                 when 400..499 then BreachAlarm::ClientError
                 when 500      then BreachAlarm::InternalServerError
                 when 501      then BreachAlarm::BadGateway
                 when 500..599 then BreachAlarm::ServerError
                 end
        klass.new(response)
      end # def klass
    end # def self.from_response

    def initialize(response=nil)
      @response = response
      super(build_error_message)
    end # def initialize

  end # class Error

  # Raised on errors in the 400-499 range.
  class ClientError < Error; end

  # Raised when BreachAlarm returns a 400 HTTP status code
  class BadRequest < ClientError; end

  # Raised when BreachAlarm returns a 401 HTTP status code
  class Unauthorized < ClientError; end

  # Raised when BreachAlarm returns a 403 HTTP status code
  class Forbidden < ClientError; end

  # Raised when BreachAlarm returns a 404 HTTP status code
  class NotFound < ClientError; end

  # Raised on errors in the 500-599 range
  class ServerError < Error; end

  # Raised when BreachAlarm returns a 500 HTTP status code
  class InternalServerError < ServerError; end

  # Raised when BreachAlarm returns a 501 HTTP status code
  class BadGateway < ServerError; end
end # module BreachAlarm
