class FourSquare

  class Client
    include Venues

    def initialize(options)
      options.each do |key, value|
        instance_variable_set("@#{key}", value)
      end

      @client ||= AFMotion::Client.build(@api_root) do
        header "Accept", "application/json"
        response_serializer :json
      end
    end

    def request(method, endpoint, params, callbacks = {}, &block)
      params.merge!(userless_access_params).merge!(version_params)

      @client.send(method, endpoint, params) do |result|
        if result.success?
          block.call(result.object)
        elsif result.failure?
          handle_errors(result, callbacks[:failure])
        end
      end
    end

    def handle_errors(result, callback = nil)
      callback ||= Proc.new {}
      errors = { description: result.error.localizedDescription }
      errors.merge!(result.object) if result.object
      callback.call(errors)
    end

    def userless_access_params
      { client_id: @client_id, client_secret: @client_secret }
    end

    def version_params
      { v: @api_version, m: @m_paramater }
    end

  end
end

