#Let's consider another problem. Try to work through the "understand the problem" part of this problem on your own, and write the input, output, and rules for it. We'll provide a solution below. Later, we'll tackle the data structure and algorithm.

# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

# input: string
# output: array of substrings
# rules:
#     Explicit requirements: 
#     -Returned array elements are all the substrings of the given string which are palindromes
#     -Palindromes are case sensitive ('Dad' isn't a palindrome, 'dad' is)
#     Implicit requirements:
#     -Substrings aren't necessarily whole words, they can be part of a string
#     -If the input string has no palindrome substrings, the result should be an empty array
#     -If the input string is an empty string, the result should be an empty array