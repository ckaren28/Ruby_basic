require_relative 'stack'
RSpec.describe Stack do
  before do
    @stack = Stack.new
  end

  describe 'attributes' do
    it 'has getters and setters for data_store' do
      @stack.data_store = [1, 2, 3]
      expect(@stack.data_store).to eq([1,2,3])
    end

    it 'has a default value of 0 for back' do
      expect(@stack.back).to eq(0)
    end

    it 'has a default value of [] for data_store' do
      expect(@stack.data_store).to eq([])
    end

    it 'should prevent users from setting back' do
      expect {@stack.back = 1}.to raise_error(NoMethodError)
    end
  end

  describe 'behavior' do
    before do
      @stack.push(1)
      @stack.push(2)
      @stack.push(3)
    end

    it 'pushes in an element to the end' do
      expect(@stack.display).to eq([1,2,3])
    end

    describe 'pop' do
      it 'pops the last-in element' do
        expect(@stack.pop).to eq(3)
        expect(@stack.display).to eq([1, 2])
        expect(@stack.pop).to eq(2)
        expect(@stack.display).to eq([1])
      end

      it 'returns nil if there is nothing to pop' do
        stack = Stack.new
        expect(stack.pop).to eq(nil)
      end
    end
  end
end
