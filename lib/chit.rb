require 'pg'

class Chit
    attr_reader :text
    def initialize(text:)
        @text = text
    end

    def self.all
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
        else
            connection = PG.connect(dbname: 'chitter')
        end

        chits = connection.exec('SELECT * FROM chits;')
        chits.map { |chit| chit['text'] }
    end

    def self.create(text:)
        if ENV['ENVIRONMENT'] == 'test'
          connection = PG.connect(dbname: 'chitter_test')
        else
          connection = PG.connect(dbname: 'chitter')
        end
      
        connection.exec("INSERT INTO chits (text) VALUES('#{text}') RETURNING id, text;")
    end


    
end