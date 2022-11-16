# The || operator returns a truthy value if either or both of its operands are truthy. If both operands are falsey, it returns a falsey value. The && operator returns a truthy value if both of its operands are truthy, and a falsey value if either operand is falsey. This works great until you need only one of two conditions to be truthy, the so-called exclusive or.

# In this exercise, you will write a method named xor that takes two arguments, and returns true if exactly one of its arguments is truthy, false otherwise. Note that we are looking for a boolean result instead of a truthy/falsy value as returned by || and &&.

def xor?(n1, n2)
  (n1 || n2) && !(n1 && n2) ? true: false
end

# Examples: should all print true

p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false

# Can you think of a situation in which a boolean xor method would be useful? Suppose you were modeling a light at the top of a flight of stairs wired in such a way that the light can be turned on or off using either the switch at the bottom of the stairs or the switch at the top of the stairs. This is an xor configuration, and it can be modeled in ruby using the xor method. Think of some additional examples.
  # You want to identify customers that have bought either of a complementary pair of products but not the other one yet
  # Video game logic if you want to give a player a bigger upgrade if they've completed either of two quests but not both
  # Comparing datasets; you want to check if say a country is in one or another dataset but not both


# || and && are so-called short circuit operators in that the second operand is not evaluated if its value is not needed. Does the xor method perform short-circuit evaluation of its operands? Why or why not? Does short-circuit evaluation in xor operations even make sense?
  # This doesn't seem to make sense since the return value depends on comparing the states of the two operands.