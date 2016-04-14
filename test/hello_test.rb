require_relative 'test_help'
require 'yaml'
require 'pry'


class HelloTest < Minitest::Test
  def setup
    @setting = YAML.load_file("test.yml")
  end

  def test_hello
    RubychinaApi::Config.client_id = @setting["client_id"]
    RubychinaApi::Config.secret = @setting["secret"]

    user = RubychinaApi::Client.login(@setting["user_info"])
    assert_equal "adam.shen", user.name
  end
end