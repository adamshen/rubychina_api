module RubychinaApi
  class Operation
    API_URL = "https://ruby-china.org/api/v3/"

    class << self
      def method_missing(method_id, *args)
        method_name = method_id.id2name
        raise "invalid operation method" unless valid_method?(method_name)
        raise "must get access_token first" unless RubychinaApi::Config.access_token

        option = {}
        option.merge!(args.pop) if args.last.is_a?(Hash)

        Faraday.send method_name,
                     "#{API_URL}#{args.join('/')}.json?access_token=#{RubychinaApi::Config.access_token}", option

      end

      private
      def valid_method?(method_name)
        %w(get post).include?(method_name)
      end
    end
  end
end
