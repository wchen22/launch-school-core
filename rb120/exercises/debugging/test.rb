class Dog
  def traits=(array)
    @traits=array
    @traits << "hungry"
  end
end

fido = Dog.new

some_traits = ['small', 'loyal']
p (fido.traits = (some_traits)) # => ["small", "loyal", "hungry"]
p some_traits # => ["small", "loyal", "hungry"]

=begin
attr_writer creates the setter as such

def trait=(trait)
  @trait = trait
end

We need to create setters in order to explicitly allow for them to be called on the object. fido.@traits = new_trait wouldn't work 

However, there's the problem of calling a setter within the scope of the class.
trait = new_trait from within the class will initialize a new local variable, so we have to use the self keyword in this instance.

Why not just always use the @traits notation? Well sometimes we want to add functionality to a setter, for example maybe we keep a log of changes to a user's account which is updated when a setter is called. This way we make sure uniform behavior happens whenever a setter is used. 

=end
