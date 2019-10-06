require_relative 'database_connection'
require 'uri'
require_relative 'user'

class Chit
  attr_reader :id, :text
  def initialize(id:, text:)
    @id = id
    @text = text
  end

  def self.all
    chits = DatabaseConnection.query('SELECT * FROM chits;')
    chits.map do |chit|
      Chit.new(
        id: chit['id'],
        text: chit['text']  
      )
    end
  end

  def self.create(text:)
    
    result = DatabaseConnection.query("INSERT INTO chits (text) VALUES('#{text}') RETURNING id, text;")
    Chit.new(id: result[0]['id'], text: result[0]['text'])
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM chits WHERE id = #{id}")
  end

  def self.update(id:, text:)
    result = DatabaseConnection.query("UPDATE chits SET text = '#{text}' WHERE id = #{id} RETURNING id, text;")
    Chit.new(id: result[0]['id'], text: result[0]['text'])
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM chits WHERE id = #{id}")
    Chit.new(id: result[0]['id'], text: result[0]['text'])
  end

  
end