module Enumerable
  def my_each
    for i in 0...self.length
      yield(self[i])
    end
  end

  def my_each_with_index
    for i in 0...self.length
      yield(self[i], i)
    end
  end

  def my_select
    new_array = []
    self.my_each do |x|
      new_array << x if yield(x)
      #pushes to the new array if x evaluates to true
    end
    new_array
  end

  def my_all?
    return true unless block_given?
    #automatically true due to no condition to fulfill

    self.my_each do |x|
      return false unless yield(x)
      #if x does not evaluates to true, returns false
    end
    true
  end

  def my_any?
    return true unless block_given?

    self.my_each do |x|
      return true if yield(x)
    end
    false
  end

  def my_none?
    return false unless block_given?
    self.my_each do |x|
      return false if yield(x)
      #if something evaluates to true, there must be a value that satisfies the condition
    end
    true
  end

  def my_count
    self.size
  end

  def my_map(*proc)
    new_arr = []
    if (proc.is_a?(Proc))
      new_arr = []
      self.my_each do |x|
        new_arr << proc.call(x)
      end
      new_arr
    else
      self.my_each do |x|
        yield x if block_given?
        new_arr << x
      end
      new_arr
    end
  end



  def my_inject(accumulator = nil)
    copy = self.new
    accumulator ||= copy.shift
    #if accumulator is nil, takes the first value of copy
    copy.my_each do |x|
      accumulator = yield(acc, x)
    end
    accumulator
  end

  def multiply_els(array)
    self.my_inject(array) {|product, number| product * number}
  end
end

my_array = [1,3,1,5]

puts "my_each test:"
my_array.my_each {|item| puts item }

puts "my_each_with_index test: "
my_array.my_each_with_index {|item, index| p "#{item}, #{index}"}

puts "Even numbers only selected: "
my_array.my_select {|item| puts item if item % 2 == 0}

puts "All even: "
puts my_array.my_all? {|num| num % 2 == 0}

puts "Any even: "
puts my_array.my_any? {|num| num % 2 == 0}

puts "None are even"
puts my_array.my_none? {|num| num % 2 == 0}

puts "count"
puts my_array.my_count {||}

p (1..4).map { |i| i*i }
p (1..4).map { "Cat" }
