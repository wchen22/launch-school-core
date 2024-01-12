some_block = Proc.new { puts "block!" }

def some_method(&some_block)
  puts "#{some_block}"
end

a = :to_s
some_method a