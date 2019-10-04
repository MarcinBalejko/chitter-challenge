
class Chit
    attr_reader :text
    def initialize(text:)
        @text = text
    end

    def self.all
        [
            "The first chit",
            "The second chit",
            "The third chit"
        ]
    end
    
end