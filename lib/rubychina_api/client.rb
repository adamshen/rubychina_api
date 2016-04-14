module RubychinaApi
  class Client
    attr_reader :id, :name, :avatar_url, :meta

    def initialize(attributes)
      @id = attributes["id"]
      @name = attributes["name"]
      @avatar_url = attributes["avatar_url"]
      @meta = attributes["meta"]
    end

    def self.login(option)
      client = OAuth2::Client.new(RubychinaApi::Config.client_id, RubychinaApi::Config.secret, site: 'https://ruby-china.org')
      RubychinaApi::Config.access_token = client.password.get_token(option["username"], option["password"]).token
      response = RubychinaApi::Operation.get("hello")
      new(JSON.parse(response.body).fetch("user"))
    end
  end
end