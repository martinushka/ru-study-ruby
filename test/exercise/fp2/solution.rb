module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each
        for i in 0...length
          yield(self[i])
        end
        self
      end

      # Написать свою функцию my_map
      def my_map(&block)
        result = MyArray.new([])
        my_reduce(result) { |acc, element| acc << block.call(element) }
      end

      # Написать свою функцию my_compact
      def my_compact
        result = MyArray.new([])
        my_reduce(result) { |acc, element| element.nil? ? acc : acc << element }
      end

      # Написать свою функцию my_reduce
      def my_reduce(initial_value = nil, &block)
        accumulator = initial_value
        my_each { |element| accumulator = accumulator ? block.call(accumulator, element) : element }
        accumulator
      end
    end
  end
end
