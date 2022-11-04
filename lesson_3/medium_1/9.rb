# Consider these two simple methods:

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

# What would be the return value of the following method invocation?

bar(foo)

# "no"
# passing the method foo into bar will pass foo's return value "yes" into bar(). param will be "yes", so param == "no" ? "yes" : "no" will evaluate to "no"