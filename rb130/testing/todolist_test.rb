require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'todolist'
system 'clear'

class TodoListTest < Minitest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @todos.each { |todo| @list.add(todo)}
  end


  def test_to_a
    assert_equal(@todos, @list.to_a)
  end


  def test_size
    assert_equal(@list.size, 3)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  # def test_last
  #   assert_equal(@todo3, @list.last)
  # end

  def test_shift
    returned_value = @list.shift
    assert_equal(@todo1, returned_value)
    assert_equal(2, @list.size)
    assert_equal([@todo2, @todo3], @list.to_a)

  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal(2, @list.size)
  end

  def test_done?
    assert_equal(false, @list.done?)
  end

  def test_bad_item
    assert_raises(TypeError) do
      @list.add("Not a todo object")
    end
  end

  def test_shovel
    laundry = Todo.new("Do Laundry")
    @list << laundry
    assert_equal(@list.to_a.last, laundry)
  end

  def test_add
    laundry = Todo.new("Do laundry")
    @list.add laundry
    @todos << laundry
    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_raises(IndexError) {@list.item_at(100)}
    assert_equal(@todo1, @list.item_at(0))
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(100) }
    assert_raises(IndexError) { @list.mark_done_at(-100) }
    @list.mark_done_at(1)
    assert_equal(false, @todo1.done?)
    assert_equal(@list.to_a[1].done?, true)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(100) }
    assert_raises(IndexError) { @list.mark_undone_at(-100) }
    @todo1.done!
    @list.mark_undone_at(1)
    assert_equal(false, @todo2.done?)
  end

  def test_done_bang
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(100) }
    assert_equal(@todo3, @list.remove_at(2))
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    output_2 = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    output_3 = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)

    @todo1.done!
    assert_equal(output_2, @list.to_s)

    @list.done!
    assert_equal(output_3, @list.to_s)
  end

  def test_each
    test_array = []

    @list.each do |list_todo|
      test_array << list_todo
    end

    assert_equal(test_array, @list.to_a)

    refute_same(test_array, @list.to_a)

    assert_equal(@list, @list.each {nil})
  end

  def test_select
    new_list = TodoList.new("Today's Todos")
    new_list.add(@todo1)
    assert_equal(new_list.first, @list.select{|todo| todo.title == 'Buy milk'}.first)
  end

  def test_all_done
    @todo1.done!
    @todo3.done!
    new_list = TodoList.new(@list.title)
    new_list << @todo1 << @todo3
    assert_equal(new_list.to_a, @list.all_done.to_a)
  end

  def test_all_not_done
    @todo2.done!
    new_list = TodoList.new(@list.title)
    new_list << @todo1 << @todo3
    assert_equal(new_list.to_a, @list.all_not_done.to_a)
  end

  def test_mark_done
    assert_equal(nil, @list.mark_done('Not a task'))
    @list.mark_done("Clean room")
    assert_equal(true, @todo2.done?)
  end

  def test_mark_all_done
    @list.mark_all_done
    assert_equal(true, @list.done?)
  end

  def test_mark_all_undone
    @list.mark_all_done
    assert_equal(true, @list.done?)
    @list.mark_all_undone
    refute_equal(true, @list.done?)
  end

end