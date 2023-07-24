# How would you order this array of number strings by descending numeric value?

arr = ['10', '11', '9', '7', '8']

# THIS SOLUTION RETURNS AN ARRAY OF INTEGERS - would have to re-map sorted array back into str if that is the desired outcome
arr_i = arr.map do |str|
  str.to_i
end

p arr_i.sort.reverse

# better yet, pass a block to #sort. 

p(
  arr.sort do |a, b|
    b.to_i <=> a.to_i
  end
)

