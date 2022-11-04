# Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

#     what is != and where should you use it?
#     put ! before something, like !user_name
#     put ! after something, like words.uniq!
#     put ? before something
#     put ? after something
#     put !! before something, like !!user_name

# ! when used before an expression negates it, such as in != or !true (ANSWER: more accurately, turns any object into the opposite of its boolean equivalent). 

# When used at the end of a method name, ! is usually used to denote a method's destructive behavior. 

# ? at the end of a method name indicates that the method returns a boolean value. It can also be used as part of the ternary operator for if...else -> conditional ? value_if_true : value_if_false

# !! before something negates it twice, so a truthy value preceded by !! will become true, while false or nil become false. 
# --In other words, turns any object into its boolean (true or false) equivalent. 