require 'pg'

class Chit
    attr_reader :id, :text
    def initialize(id:, text:)
        @id = id
        @text = text
    end

    def self.all
        if ENV['ENVIRONMENT'] == 'test'
          connection = PG.connect(dbname: 'chitter_test')
        else
          connection = PG.connect(dbname: 'chitter')
        end
        result = connection.exec("SELECT * FROM chits")
        result.map do |chit|
          Chit.new(id: chit['id'], text: chit['text'])
        end
    end

    def self.create(text:)
        
        if ENV['ENVIRONMENT'] == 'test'
          connection = PG.connect(dbname: 'chitter_test')
        else
          connection = PG.connect(dbname: 'chitter')
        end
        result = connection.exec("INSERT INTO chits (text) VALUES('#{text}') RETURNING id, text;")
        Chit.new(id: result[0]['id'], text: result[0]['title'])
      end


    
end