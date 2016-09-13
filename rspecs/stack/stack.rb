class Stack
    attr_accessor :data_store
    attr_reader :back
    def initialize
        @data_store = []
        @back = 0
    end
    def push(val)
        @data_store[@back] = val
        @back += 1
    end
    def pop
        if @data_store[@back - 1]
        @back -= 1
        @data_store[@back]
        else
            nil
        end
    end
    def display
    output = []
    for i in 0...@back
      output << @data_store[i]
    end
    output
  end

end
