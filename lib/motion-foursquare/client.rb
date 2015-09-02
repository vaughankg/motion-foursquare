class Foursquare

  class Client
    include Venues

    attr_accessor :api_root, :client_id, :client_secret, :api_version, :m_parameter

    def initialize(options = {})
      Foursquare.default_options.merge(options).each do |key, value|
        send("#{key}=", value)
      end

      @client ||= AFMotion::Client.build(@api_root) do
        header "Accept", "application/json"
        response_serializer :json
      end
    end

    def api_params
      {
        client_id: @client_id,
        client_secret: @client_secret,
        m: @m_parameter,
        v: @api_version
      }
    end

    def request(method, endpoint, params, callbacks = {}, &block)
      params.merge!(api_params)

      @client.send(method, endpoint, params) do |result|
        if result.success?
          block.call(result.object["response"])
        elsif result.failure?
          handle_errors(result, callbacks[:failure])
        end
      end
    end

    def handle_errors(result, callback = nil)
      callback ||= Proc.new {}
      errors = { description: result.error.localizedDescription, result: result}
      errors.merge!(result.object) if result.object
      callback.call(errors)
    end

  end
end

