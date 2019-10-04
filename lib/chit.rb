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

        result = connection.exec('SELECT * FROM chits;')
        result.map { |chit| chit['text'] }
    end
    
end