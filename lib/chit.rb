require 'pg'

class Chit
    attr_reader :text
    def initialize(text:)
        @text = text
    end

    def self.all
        connection = PG.connect(dbname: 'chitter')
        result = connection.exec('SELECT * FROM chits;')
        result.map { |chit| chit['text'] }
    end
    
end