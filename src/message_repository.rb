require_relative 'message'

class MessageRepository
  def initialize(conn = PG.connect(dbname: 'ruby_minimal_deps_development'))
    @conn = conn
  end

  def first_message
    result = conn.exec('SELECT message FROM messages LIMIT 1')
    record = result[0]
    message_from_record(record)
  end

  private

  attr_reader :conn

  def message_from_record(record)
    Message.new(
      id: record['id'],
      message: record['message'],
    )
  end
end
