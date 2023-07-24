# Write a method that takes an arbitrary matrix and rotates it 90 degrees clockwise.

def rotate90(matrix)
  new_matrix = []

  0.upto(matrix[0].size - 1) do |col|
    new_row = []

    (matrix.size - 1).downto(0) do |row|
      new_row << matrix[row][col]
    end

    new_matrix << new_row
  end

  new_matrix
end


matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2

# Further Exploration
# Can you modify your solution to perform 90, 180, 270, and 360 degree rotations based on an argument?

def rotate(matrix, rotations = 1) 
  # Could take angle values and standardize to 1-4 rotations
  (rotations % 4).times do
    matrix = rotate90(matrix)
  end
  matrix
end

p rotate(matrix1, 4)


