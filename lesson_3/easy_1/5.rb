# Programmatically determine if 42 lies between 10 and 100.

puts (10..100).include?(42) 
puts (10..100).cover?(42) 

# Aside: difference between Range#include? and #cover? is that include will check whether the objet is actually one of the range's elements, while cover just checks if the object is between edge elements. ('a'..'z').cover?('cc') would be true, while include? would be false. 