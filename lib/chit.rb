
class Chit
    attr_reader :title
    def initialize(title:)
        @title = title
    end

    def self.all
        [
            "The first chit",
            "The second chit",
            "The third chit"
        ]
    end
    
end