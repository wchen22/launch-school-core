# How do you find where Ruby will look for a method when that method is called? How can you find an object's ancestors?

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

p Orange.ancestors

begin
  p HotSauce.new.ancestors # This throws an error
rescue => e
  p e
end

p HotSauce.ancestors
# What is the lookup chain for Orange and HotSauce?

