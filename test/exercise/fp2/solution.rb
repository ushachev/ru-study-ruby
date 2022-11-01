module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        return self if empty?

        head, *tail = self
        block.call(head)

        MyArray.new([head]).concat MyArray.new(tail).my_each(&block)
      end

      # Написать свою функцию my_map
      def my_map(&block)
        my_reduce(MyArray.new) { |acc, element| acc << block.call(element) }
      end

      # Написать свою функцию my_compact
      def my_compact
        my_reduce(MyArray.new) { |acc, element| element.nil? ? acc : acc << element }
      end

      # Написать свою функцию my_reduce
      def my_reduce(initial_operand = nil, &block)
        return initial_operand if empty?

        head, *tail = self
        acc = initial_operand.nil? ? head : block.call(initial_operand, head)

        MyArray.new(tail).my_reduce(acc, &block)
      end
    end
  end
end
