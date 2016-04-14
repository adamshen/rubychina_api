# RubychinaApi

为了了解如何用Ruby写Web api wrapper做的实验

## Installation

```ruby
gem 'rubychina_api'
```

## Usage

#### Api手册

[https://ruby-china.org/api/](https://ruby-china.org/api/)

#### 登录
```ruby
RubychinaApi::Config.client_id = "blabla"
RubychinaApi::Config.secret = "blabla"

RubychinaApi::Client.login("username" => "name", "password" => "xxxx")
=> #<RubychinaApi::Client:0x007fda3cdf98f0
 @avatar_url=
  "https://ruby-china-files.b0.upaiyun.com/user/large_avatar/xxxxx.jpg",
 @id=xxxxx,
 @meta=nil,
 @name="xxxx">
```

#### Api请求
使用get、post方法请求数据
```ruby
response = RubychinaApi::Operation.get("topics")
JSON.parse(response.body)["topics"].last.fetch("title")
=> "Rails－ 让我欢喜让我忧！"
```

需要二级url时，增加参数
```ruby
response = RubychinaApi::Operation.get("topics", "24325")
JSON.parse(response.body).dig("topic","title")
=> "《提问的智慧》"
```

需要params时，增加hash作为尾参数
```ruby
response = RubychinaApi::Operation.get("topics", {"type": "no_reply"})
JSON.parse(response.body)["topics"].first.fetch("id")
=> "给指定 url POST 包的时候，用 YAML.load_file 方法：当 YML 文件内有汉字时，报 utf-8 错"
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

