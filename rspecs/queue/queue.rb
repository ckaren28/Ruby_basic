class Queue
    attr_accessor :data_store
    attr_reader :back
    def initialize
        @data_store = []
        @back = 0
        @min = min
        @max = max
    end
    def enqueue(val)
        @data_store[@back] = val
        @back += 1
    end
    def dequeue
        if @data_store[0]
            front = @data_store[0]
            @data_store = @data_store[1..-1]
            @back -= 1
            @data_store[@back]
            front
        else
            nil
        end
    end
    def display
        output = []
        for i in (0...@back)
            output << @data_store[i]
        end
        output
    end
    def min
        if @data_store != []
            @data_store.min
        else
            nil
        end
    end
    def max
        if @data_store.empty? == false
            @data_store.max
        else
            nil
        end
    end

end
