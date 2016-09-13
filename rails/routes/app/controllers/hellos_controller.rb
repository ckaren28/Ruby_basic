class HellosController < ApplicationController
    def main
        render text: "Hello CodingDojo!"
    end
    def hello
        render text: "Saying Hello!"
    end
    def joe
        render text: "Saying hello to Joe"
    end
    def michael
        redirect_to '/say/hello/joe'
    end
end
