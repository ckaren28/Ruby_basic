require_relative 'queue'
RSpec.describe Queue do
    before do
        @queue = Queue.new
        @queue.data_store = [1, 2, 3]
    end
    describe 'attributes' do
        it "has getters and setters" do
            expect(@queue.data_store).to eq([1, 2, 3])
        end
        it "has 0 by deafult in the back" do
            expect(@queue.back).to eq(0)
        end
        it 'has a default value of [] for data_store' do
            queue1 = Queue.new
            expect(queue1.data_store).to eq([])
        end
        it 'should prevent users from setting back' do
            expect { @queue.back = 1 }.to raise_error(NoMethodError)
        end
        it 'has a min' do
            expect(@queue.min).to eq(1)
        end
        it 'has a max' do
            expect(@queue.max).to eq(3)
        end
    end
    describe 'behavior' do
        before do
            @queue.enqueue(1)
            @queue.enqueue(2)
            @queue.enqueue(3)
        end
        it "adds value to the end" do
            expect(@queue.display).to eq([1, 2, 3])
        end
        it "removes first value of the queue, or returns nil if there is nothing to dequeue" do
            expect(@queue.dequeue).to eq(1)
            expect(@queue.display).to eq([2, 3])
            expect(@queue.dequeue).to eq(2)
            expect(@queue.display).to eq([3])
            expect(@queue.dequeue).to eq(3)
            expect(@queue.display).to eq([])
            expect(@queue.dequeue).to eq(nil)
        end
    end
end
