# Bubble Sort is one of the simplest sorting algorithms available. It isn't an efficient algorithm, but it's a great exercise for student developers. In this exercise, you will write a method that does a bubble sort of an Array.

# A bubble sort works by making multiple passes (iterations) through the Array. On each pass, each pair of consecutive elements is compared. If the first of the two elements is greater than the second, then the two elements are swapped. This process is repeated until a complete pass is made without performing any swaps; at that point, the Array is completely sorted.

# For further information, including pseudo-code that demonstrates the algorithm as well as a minor optimization technique, see the Bubble Sort wikipedia page.

# Write a method that takes an Array as an argument, and sorts that Array using the bubble sort algorithm as just described. Note that your sort will be "in-place"; that is, you will mutate the Array passed as an argument. You may assume that the Array contains at least 2 elements.

# Problem
  # Input: An array with 2+ elements
  # Output: none, action: sort array in place
# Examples (see below)
# Data Structure
  # Arrays
# Algorithm
  # loop 
    # swaps = 0
    # 0 upto array size - 2 |start_index|
      # Compare array[start_index] with array[start_index + 1]
      # If >, 
        # swap the elements
        # swaps += 1
    # Break if swaps = 0
  # 

def bubble_sort!(ary)
  starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  loop do
    swaps = 0

    0.upto(ary.size - 2) do |first_idx|
      if ary[first_idx] > ary[first_idx + 1]
        ary[first_idx, 2] = ary[first_idx +1], ary[first_idx]
        swaps += 1
      end
    end

    break if swaps == 0
  end

  ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  p ending - starting
end

# Examples

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4] * 1500
bubble_sort!(array)
# p array# == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

# Further Exploration
# Note that we did not use the optimization suggested on the Wiki page that skips looking at tail elements that we know are already sorted. If your solution also skipped this optimization, try modifying your solution so it uses that optimization.

def bubble_sort!(ary)
  starting = Process.clock_gettime(Process::CLOCK_MONOTONIC)

  last_idx = ary.size - 1

  loop do
    swaps = 0

    0.upto(last_idx - 1) do |first_idx|
      if ary[first_idx] > ary[first_idx + 1]
        ary[first_idx, 2] = ary[first_idx +1], ary[first_idx]
        swaps += 1
      end
    end

    last_idx -= 1
    break if swaps == 0
  end

  ending = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  p ending - starting
end

array = [6, 2, 7, 1, 4] * 1500
bubble_sort!(array)
