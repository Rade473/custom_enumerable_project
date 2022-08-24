module Enumerable
  # Your code goes here
  def my_each_with_index(&block)
    index = 0
    for element in self
      block.call(element, index)
      index += 1
    end
  end

  def my_select(&block)
    result = []
    for element in self 
      if block.call(element)
        result << element
      end
    end
    result
  end

  def my_all?(&block)
    result = false
    for element in self
      if block.call(element)
        result = true
      else
        result = false
      end
    end
    result
  end

  def my_any?(&block)
    result = false
    for element in self
      if block.call(element)
        result = true
        return result
      else
        result = false
      end
    end
    result
  end

  def my_none?(&block)
    result = true
    for element in self
      if block.call(element)
        result = false
        return result
      else
        result = true
      end
    end
    result
  end

  def my_count(&block)
    result = 0
    for element in self 
      if block_given?
        if block.call(element)
          result += 1
        else
          result
        end
      else
        result += 1
      end
      end
    result
  end

  def my_map(&block)
    result = []
    self.each do |element|
      result << block.call(element)
    end
    result
  end

  def my_inject(value, &block)
    if value == 1
      self.each do |element|
        value = value*element
      end
      value
    else
      self.each do |element|
        value += element
      end
      value
    end
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each(&block)
    for element in self
      block.call(element)
   end
  end
end
