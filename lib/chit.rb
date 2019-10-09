require_relative 'database_connection'
require 'uri'
require_relative 'user'

class Chit
  attr_reader :id, :text, :time, :author_id, :author_email, :author_name
  def initialize(id:, text:, time:, author_id:, author_email:, author_name:)
    @id = id
    @text = text
    @time = time
    @author_id = author_id
    @author_email = author_email
    @author_name = author_name
  end

  def self.all
    chits = DatabaseConnection.query('SELECT * FROM chits;')
    chits.map do |chit|
      Chit.new(
        id: chit['id'],
        text: chit['text'],
        time: chit['time'],
        author_id: chit['author_id'],
        author_email: chit['author_email'],
        author_name: chit['author_name']
      )
    end
  end

  def self.create(text:, time:, author_id:, author_email:, author_name:)
    
    result = DatabaseConnection.query("INSERT INTO chits (text, time, author_id, author_email, author_name) VALUES('#{text}', '#{time}', '#{author_id}', '#{author_email}', '#{author_name}') RETURNING id, text, author_id, author_email, author_name;")
    Chit.new(id: result[0]['id'], text: result[0]['text'], time: result[0]['time'], author_id: result[0]['author_id'], author_email: result[0]['author_email'], author_name: result[0]['author_name'])
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM chits WHERE id = #{id}")
  end

  def self.update(id:, text:, time:, author_id:, author_email:, author_name:)
    result = DatabaseConnection.query("UPDATE chits SET text = '#{text}', time = '#{time}' WHERE id = #{id} RETURNING id, text, time, author_id, author_email, author_name;")
    Chit.new(id: result[0]['id'], text: result[0]['text'], time: result[0]['time'], author_id: result[0]['author_id'], author_email: result[0]['author_email'], author_name: result[0]['author_name'])
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM chits WHERE id = #{id}")
    Chit.new(id: result[0]['id'], text: result[0]['text'], time: result[0]['time'], author_id: result[0]['author_id'], author_email: result[0]['author_email'], author_name: result[0]['author_name'])
  end

end