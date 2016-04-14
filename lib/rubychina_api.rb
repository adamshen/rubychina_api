require "oauth2"
require "json"
require "faraday"

require_relative "rubychina_api/version"
require_relative "rubychina_api/client"
require_relative "rubychina_api/operation"

module RubychinaApi
  class Config
    class << self
      attr_accessor :client_id, :secret, :access_token
    end
  end
end