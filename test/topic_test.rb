require_relative 'test_help'

class TopicTest < Minitest::Test
  def setup
    setting = YAML.load_file("test.yml")
    RubychinaApi::Config.client_id = setting["client_id"]
    RubychinaApi::Config.secret = setting["secret"]

    @user = RubychinaApi::Client.login(setting["user_info"])
  end

  def test_topic
    assert RubychinaApi::Config.access_token

    response = RubychinaApi::Operation.get("topics").body
    assert JSON.parse(response)["topics"].first.has_key?("title")

    response = RubychinaApi::Operation.get("topics", "24325").body
    assert_equal "《提问的智慧》", JSON.parse(response).dig("topic","title")

    response = RubychinaApi::Operation.get("topics", {"type": "no_reply"}).body
    assert JSON.parse(response)["topics"].first.fetch("id")
  end
end