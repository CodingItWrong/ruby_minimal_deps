require 'rack'
require 'pg'
require_relative 'src/message_repository'

messages = MessageRepository.new

hello = ->(env) {
  message = messages.first_message
  [200, {'Content-Type' => 'text/plain'}, [message.message]]
}

app = Rack::URLMap.new(
  '/hello' => hello,
)

run app
