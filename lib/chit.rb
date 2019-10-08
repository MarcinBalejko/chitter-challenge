require_relative 'database_connection'
require 'uri'
require_relative 'user'

class Chit
  attr_reader :id, :text, :author_id, :author_email
  def initialize(id:, text:, author_id:, author_email:)
    @id = id
    @text = text
    @author_id = author_id
    @author_email = author_email
  end

  def self.all
    chits = DatabaseConnection.query('SELECT * FROM chits;')
    chits.map do |chit|
      Chit.new(
        id: chit['id'],
        text: chit['text'],
        author_id: chit['author_id'],
        author_email: chit['author_email']  
      )
    end
  end

  def self.create(text:, author_id:, author_email:)
    
    result = DatabaseConnection.query("INSERT INTO chits (text, author_id, author_email) VALUES('#{text}', '#{author_id}', '#{author_email}') RETURNING id, text, author_id, author_email;")
    Chit.new(id: result[0]['id'], text: result[0]['text'], author_id: result[0]['author_id'], author_email: result[0]['author_email'])
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM chits WHERE id = #{id}")
  end

  def self.update(id:, text:, author_id:, author_email:)
    result = DatabaseConnection.query("UPDATE chits SET text = '#{text}' WHERE id = #{id} RETURNING id, text, author_id, author_email;")
    Chit.new(id: result[0]['id'], text: result[0]['text'], author_id: result[0]['author_id'], author_email: result[0]['author_email'])
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM chits WHERE id = #{id}")
    Chit.new(id: result[0]['id'], text: result[0]['text'], author_id: result[0]['author_id'], author_email: result[0]['author_email'])
  end

end