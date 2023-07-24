# Documentation Again

1. Class and Instance Methods
   * Locate the ruby documentation for methods File::path and File#path. How are they different?
     * File::path is a class method which returns the string representation of a path. It is called on the File class: File.path(*path*)
     * File#path is an instance method which returns the pathname used to create the calling file as a string. It is invoked by an object of the File class.

2. Optional Arguments Redux
   * Assume you have the following code:
    ```
    require 'date'

    puts Date.civil
    puts Date.civil(2016)
    puts Date.civil(2016, 5)
    puts Date.civil(2016, 5, 13)
    ```
    What will each of the 4 puts statements print?
      ```
      -4712-01-01
      2016-01-01
      2016-05-01
      2016-05-13
      ```
3. Default Arguments in the Middle
   * Consider the following method and a call to that method:
    ```
    def my_method(a, b = 2, c = 3, d)
      p [a, b, c, d]
    end

    my_method(4, 5, 6)
    ```
      Use the ruby documentation to determine what this code will print.

    ```
      [4, 5, 3, 6]
    ```
4. Mandatory Blocks
   * The Array#bsearch method is used to search ordered Arrays more quickly than #find and #select can. Assume you have the following code:
    ```
    a = [1, 4, 8, 11, 15, 19]
    ```
      How would you search this Array to find the first element whose value exceeds 8?
    ```
    a.bsearch {|x| x > 8}
5. Multiple Signatures
   * What do each of these puts statements output?
    ```
    a = %w(a b c d e)
    puts a.fetch(7)
    puts a.fetch(7, 'beats me')
    puts a.fetch(7) { |index| index**2 }
    ```
    ```
    IndexError
    beats me
    49
    ```
6. Keyword Arguments 
   * What does this code print?
    ```
    5.step(to: 10, by: 3) { |value| puts value }
    ```
    ```
    5
    8
    ```
7. Parent Class
   * Use irb to run the following code:
    ```
    s = 'abc'
    puts s.public_methods.inspect
    ```
    You should find that it prints a list of all of the public methods available to the String s; this includes not only those methods defined in the String class, but also methods that are inherited from Object (which inherits other methods from the BasicObject class and the Kernel module). That's a lot of methods.

    How would you modify this code to print just the public methods that are defined or overridden by the String class? That is, the list should exclude all members that are only defined in Object, BasicObject, and Kernel.
    ```
    puts s.public_methods(false).inspect
    ```
8. Included Modules
   
   *For this exercise, start by using version 2.3.0 of the Ruby Array Documentation.*

   Use irb to run the following code:
    ```
    a = [5, 9, 3, 11]
    puts a.min
    ```

    Find the documentation for the #min method and change the above code to print the two smallest values in the Array.

    - 2.3.0's documentation lacks an Array#min method, even though this code does work in 2.3.0.
    - A feature of Ruby is **mix-in** modules. Classes can use a mix-in module's methods by using the ```include``` method. In the documentation for Array, we see that Enumerable is an included module, which does have the #min method. Using that page, we can see that we can pass an integer argument to min indiciating how many smallest values to return as an array.
    ```
    puts a.min(2)
    ```
9.  Down the Rabbit Hole
    
    Sometimes, the documentation is going to leave you scratching your head.

    In a very early assignment at Launch School, you are tasked with writing a program that loads some text messages from a YAML file. We do this with YAML::load_file:
    ```
    require 'yaml'
    MESSAGES = YAML.load_file('calculator_messages.yml')
    ```
    Find the documentation for YAML::load_file.
    * https://ruby-doc.org/stdlib-1.8.6/libdoc/yaml/rdoc/YAML.html#method-c-load_file
    * https://ruby-doc.org/stdlib-3.1.2/libdoc/psych/rdoc/Psych.html (Answer provided by LS)

