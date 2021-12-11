require 'rack'
require 'pg'
require_relative 'src/message_repository'

messages = MessageRepository.new

hello = ->(env) {
  result = messages.first_message
  message = result[0]['message']
  [200, {'Content-Type' => 'text/plain'}, [message]]
}

app = Rack::URLMap.new(
  '/hello' => hello,
)

run app
