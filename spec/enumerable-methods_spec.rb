require_relative '../enumerable-methods.rb'

module Enumerable
  RSpec.describe do
    let(:array) { [5, 12, 34] }

    context '.my_each' do
      it 'returns each item from the array' do
        test_array = []

        array.my_each { |element| test_array << element }
        expect(test_array).to eq array
      end
    end

    context '.my_each_with_index' do
      it 'returns each item and their index' do
        hash = {}

        array.my_each_with_index { |element, index| hash[index] = element }

        expect(hash[0]).to eq 5
        expect(hash[1]).to eq 12
        expect(hash[2]).to eq 34
      end
    end

    context '.my_select' do
      it 'selects only the items that evaluate to true' do
        test_array = []

        test_array.concat(array.my_select { |element| element > 10 })

        expect(test_array[0]).to eq 12
        expect(test_array.size).to eq 2
      end
    end

    context '.my_all?' do
      it 'returns true if condition is fulfilled by all values' do
        expect(array.my_all? { |element| element > 0 }).to eq true
      end

      it 'returns true if no block given, due to no condition to fulfill' do
        expect(array.my_all?).to eq true
      end

      it 'returns false if any value does not fulfill the condition' do
        expect(array.my_all? { |element| element > 100 }).to eq false
      end
    end

    context '.my_inject' do
      it 'returns the sum of all items' do
        expect(array.my_inject { |acc, element| acc + element }).to eq 51
      end

      it 'returns the accumulator' do
        expect(array.my_inject(5) { |acc, _element| acc }).to eq 5
      end

      it 'raises an error if no block given' do
        expect { array.my_inject }.to raise_error LocalJumpError
      end
    end

    context '.my_map' do
      it 'returns a new array with the same values + 1' do
        new_array = array.my_map { |element| element + 1 }

        expect(new_array[0]).to eq 6
        expect(new_array.size).to eq 3
      end
    end
  end
end
