class MessageRepository
  def initialize(conn = PG.connect(dbname: 'ruby_minimal_deps_development'))
    @conn = conn
  end

  def first_message
    conn.exec('SELECT message FROM messages LIMIT 1')
  end

  private

  attr_reader :conn
end
