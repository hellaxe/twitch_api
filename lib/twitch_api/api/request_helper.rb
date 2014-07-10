module TwitchApi
  module Api
    module RequestHelper
      DEFAULT_HEADERS = {
        'Accept' => 'application/vnd.twitchtv.v3+json'
      }
      def get(path, options = {})
        headers = prepare_headers(options[:headers] || {})
        c = Curl.get(path) do |curl|
          curl.headers.merge!(headers)
        end
        response = JSON.parse(c.body_str, symbolize_names: true)
        raise_error(response)
        response
      end

      def post(path, data = {}, options ={})
        headers = prepare_headers(options[:headers] || {})
        c = Curl.post(path, data) do |curl|
          curl.headers.merge!(headers)
        end
        response = JSON.parse(c.body_str, symbolize_names: true)
        raise_error(response)
        response
      end

      protected 
      def prepare_headers(headers = {})
        headers = DEFAULT_HEADERS.merge(headers)
        headers['Authorization'] = "OAuth #{@access_token}" if @access_token
        headers
      end
      def raise_error(data)
        case data[:status]
        when 401
          raise TwitchApi::Errors::UnauthorizedError.new, "#{data[:error]}: #{data[:message]}"
        end
      end
    end
  end
end
