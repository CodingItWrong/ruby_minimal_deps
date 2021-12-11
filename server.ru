require 'rack'
require 'pg'

conn = PG.connect(dbname: 'ruby_minimal_deps_development')

hello = ->(env) {
  result = conn.exec('SELECT message FROM messages LIMIT 1')
  message = result[0]['message']
  [200, {'Content-Type' => 'text/plain'}, [message]]
}

app = Rack::URLMap.new(
  '/hello' => hello,
)

run app
