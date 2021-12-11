require 'rack'

hello = ->(env) {
  [200, {'Content-Type' => 'text/plain'}, ['Hello, world!']]
}

app = Rack::URLMap.new(
  '/hello' => hello,
)

run app
