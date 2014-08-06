module TwitchApi
  module Api
    module RequestHelper
      DEFAULT_HEADERS = {
        'Accept' => 'application/vnd.twitchtv.v3+json'
      }
      def get(path, options = {})
        headers = prepare_headers(options[:headers] || {})
        c = Curl::Easy.http_get(path + build_query_string(options[:query])) do |curl|
          curl.headers.merge!(headers)
        end
        response = build_response_hash(c)
        raise_error(response) if TwitchApi.throw_errors
        response
      end

      def post(path, options ={})
        headers = prepare_headers(options[:headers])
        data = options.delete :data
        c = Curl.post(path, data) do |curl|
          curl.headers.merge!(headers)
        end
        response = build_response_hash(c)
        raise_error(response) if TwitchApi.throw_errors
        response
      end

      def put(path, options = {})
        headers = prepare_headers(options[:headers])
        data = options.delete :data
        c = Curl.put(path, data.to_json) do |curl|
          curl.headers.merge!(headers)
          curl.headers["content-type"] = "application/json"
        end
        response = build_response_hash(c)
        raise_error(response) if TwitchApi.throw_errors
        response
      end

      def delete(path, options = {})
        headers = prepare_headers(options[:headers])
        c = Curl.delete(path) do |curl|
          curl.headers.merge!(headers)
        end
        response = build_response_hash(c)
        raise_error(response) if TwitchApi.throw_errors
        response
      end

      protected 
      def prepare_headers(headers = {})
        headers ||= {}
        headers['Authorization'] = "OAuth #{@access_token}" if @access_token
        headers = DEFAULT_HEADERS.merge(headers)
        headers
      end

      def build_response_hash(curl)
        response = { status_code: curl.response_code }
        unless curl.body_str.empty?
          response.merge!(JSON.parse(curl.body_str, symbolize_names: true))
        end
        response 
      end

      def raise_error(data)
        case data[:status_code]
        when [200..204]
          return
        when 401
          raise TwitchApi::Errors::UnauthorizedError.new, "#{data[:error]}: #{data[:message]}"
        end
        if data[:status_code]
          raise TwitchApi::Errors::TwitchApiError.new, "#{data[:error]}: #{data[:message]}"
        end
      end
    end
  end
end
