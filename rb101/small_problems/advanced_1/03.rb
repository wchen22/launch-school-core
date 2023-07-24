# Write a method that takes a 3 x 3 matrix in Array of Arrays format and returns the transpose of the original matrix. Note that there is a Array#transpose method that does this -- you may not use it for this exercise. You also are not allowed to use the Matrix class from the standard library. Your task is to do this yourself.

# Take care not to modify the original matrix: you must produce a new matrix and leave the original matrix unchanged.

def transpose(matrix)
  new_matrix = []

  0.upto(matrix[0].size - 1) do |col_idx|
    new_row = matrix.map { |row| row[col_idx]}
    new_matrix << new_row
  end

  new_matrix
end

# Examples

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

p transpose([
  [1, 2, 3],
  [4, 5, 6]
])

# Further Exploration
# Write a transpose! method that transposes a matrix in place. The obvious solution is to reuse transpose from above, then copy the results back into the array specified by the argument. For this method, don't use this approach; write a method from scratch that does the in-place transpose.

def transpose!(matrix)
  new_matrix = []

  0.upto(matrix[0].size - 1) do |col_idx|
    new_row = matrix.map { |row| row[col_idx]}
    new_matrix << new_row
  end

  new_matrix.each_with_index do |_row, idx|
    matrix[idx] = new_matrix[idx]
  end
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

transpose!(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]

a = [
  [1, 2, 3],
  [4, 5, 6]
]
transpose!(a)
p a
