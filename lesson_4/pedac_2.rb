# Imagine a sequence of consecutive even integers beginning with 2. The integers are grouped in rows, with the first row containing one integer, the second row two integers, the third row three integers, and so on. Given an integer representing the number of a particular row, return an integer representing the sum of all the integers in that row.

## P: Problem
    # Explicit:
    # -Input: An integer representing a row number
    # -Output: An integer representing the sum of all the integers in a row

    # Implicit:
    # -Assumptions: Every other number signifies starting with the first element, then the third element, fifth, and so forth.
    # -Sequence of numbers starting with 2 (2, 4, 6, 8, 10, 12, 14, 16...)
    # -Integers are grouped into rows, each containing one element more than the last
    # -Row "number" is same as number of elements in that row
    # 2
    # 4, 6
    # 8, 10, 12
    # 14, 16, 18, 20
    # ...

## E: Examples/Test Cases
    # 2 => 2
    # 4, 6 => 10
    # 8, 10, 12 => 30
    # 14, 16, 18, 20 => 68
    
    # 1 would be 2
    # 2 would be 10
    # 4 would be 68

## D: Data Structures
    # Each row can be represented by an array of ordered numbers, and with multiple ordered rows, a nested array makes sense.
    # [
    #     [2],
    #     [4, 6],
    #     [8, 10, 12],
    #     [14, 16, 18, 20]
    # ]

## A: Algorithms
    # 1. Given a row number n
    # 2. Create an empty array 'rows' to store all rows
    # 3. Create an empty array 'row' for the current row
    # 4. n number of times, create a row and push it into the rows array
    # 5. Return the sum of the final row's elements

    # ~ 4. n number of times, create a row and push it into the rows array
    #   - Iterating from 1 to n
    #     - Until row.size >= current iteration index
    #         - Push to row the next number in the sequence
    #           -Set an integer equal to 2 outside the iteration loop
    #           -Increment it by 2 with each iteration
    #     - Push the populated row array into rows array

## C: Code

def sum_of_row(row_num)
  rows = []
  row = []
  for i in (1..row_num)
    if i == 1
      row << 2
    else
      current_number = row[-1] + 2
      row = []
      until row.size >= i
        row << current_number
        current_number += 2
      end
    end
    rows << row
  end
  rows[-1].sum
end

# Tests
# row number: 1 --> sum of integers in row: 2
# row number: 2 --> sum of integers in row: 10
# row number: 4 --> sum of integers in row: 68

p sum_of_row(1) == 2 # true
p sum_of_row(2) == 10 # true
p sum_of_row(4) == 68 # true

