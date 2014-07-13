module TwitchApi
  module QueryHelper
    def build_query_string(query = {})
      query ||= {}
      raise TwitchApi::Errors::TwitchApiError, "query must be a hash" unless query.is_a? Hash
      if query.empty?
        ""
      else
        "?" + query.map{|k,v| "#{k}=#{v.to_s.gsub(' ', '+')}"}.join("&")
      end
    end
  end
end
