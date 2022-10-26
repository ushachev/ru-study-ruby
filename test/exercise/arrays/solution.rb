module Exercise
  module Arrays
    class << self
      def replace(array)
        max_of_array = array.inject { |max, el| el > max ? el : max }
        array.map { |el| el.positive? ? max_of_array : el }
      end

      def search(array, query)
        iter = lambda { |low_index, high_index|
          return -1 if high_index < low_index

          middle_index = (low_index + high_index) / 2
          middle_value = array[middle_index]

          return middle_index if query == middle_value

          if query > middle_value
            iter.call(middle_index + 1, high_index)
          else
            iter.call(low_index, middle_index - 1)
          end
        }

        iter.call(0, array.size - 1)
      end
    end
  end
end
