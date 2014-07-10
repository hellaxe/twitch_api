module TwitchApi
  module QueryHelper
    def build_query_string(options = {})
      "?" + options.map{|k,v| "#{k}=#{v.to_s.gsub(' ', '+')}"}.join("&")
    end

    def filter_hash(whitelist = [], options = {})
      options.select{|k,v| whitelist.include? k}
    end
  end
end
