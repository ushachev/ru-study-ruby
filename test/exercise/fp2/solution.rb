module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        iter = lambda { |collection|
          return self if collection.empty?

          head, *tail = collection
          block.call(head)
          iter.call(tail)
        }

        iter.call(self)
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
        iter = lambda { |collection, acc|
          return acc if collection.empty?

          head, *tail = collection
          iter.call(tail, block.call(acc, head))
        }

        if initial_operand.nil?
          first, *rest = self
          iter.call(rest, first)
        else
          iter.call(self, initial_operand)
        end
      end
    end
  end
end
