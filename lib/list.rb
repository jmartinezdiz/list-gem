# frozen_string_literal: true

# Class that allows define a list of elements
class List
  ######################################################
  # REQUIREMENTS
  ######################################################
  require "awesome_print"
  require_relative "list/element"
  require_relative "list/version"

  ######################################################
  # CONSTRUCTOR
  ######################################################

  # Initialiser of List.
  # @param [Array<Object>] *args Any number of Objects to initialize into List.
  def initialize(*args)
    @first_element = nil
    @last_element = nil
    @length = 0
    self.push(*args) if args.any?
  end

  ######################################################
  # INSTANCE METHODS
  ######################################################

  # Get object in first position.
  # @return [Object] the object in first position.
  def first
    @first_element&.object
  end

  # Get object in last position.
  # @return [Object] the object in last position.
  def last
    @last_element&.object
  end

  # Get number of elements of list.
  # @return [Integer] number of elements.
  def length
    @length
  end

  # Add elements into start of list
  # @param [Array<Object>] *args Any number of Objects to introduce into List.
  # @return [List] list with new object.
  def unsift(*args)
    args.each do |object|
      new_element = List::Element.new(object)
      if @first_element
        new_element.next = @first_element
        @first_element.previous = new_element
      else
        @last_element = new_element
      end
      @first_element = new_element
      @length += 1
    end
    self
  end

  # Add elements into end of list.
  # @param [Array<Object>] *args Any number of Objects to introduce into List.
  # @return [List] list with new object.
  def push(*args)
    args.each do |object|
      new_element = List::Element.new(object)
      if @last_element
        @last_element.next = new_element
      else
        @first_element = new_element
      end
      @last_element = new_element
      @length += 1
    end
    self
  end

  # Iterate all elements in list executing block with each element.
  # @yield Block to execute with each element.
  # @return [List] iterated list.
  def each(&block)
    if block_given?
      element = @first_element
      while element
        block.call(element.object)
        element = element.next
      end
    end
    self
  end

  # Create a new List with elements that meets block.
  # @yield Block to execute condition with each element.
  # @return [List] new list with selected elements.
  def select(&block)
    new_list = self.class.new
    self.each do |object|
      new_list.push(object) if !block_given? || block.call(object)
    end
    new_list
  end

  # Create a new Array with elements block execution.
  # @yield Block with element to return with each element.
  # @return [Array<Object>] array with result.
  def map(&block)
    result = []
    self.each do |object|
      result << (block_given? ? block.call(object) : object)
    end
    result
  end

  # Returns all elements into List converted to Array.
  # @return [Array<Object>] array of all elements
  def to_a
    self.map{|x| x}
  end

  # Prints elements in list.
  # @return nil
  def beautiful_print
    ap to_a
    nil
  end

  # Get inspect description.
  # @return [String] information of list instance.
  def inspect
    "#{self.class.name}: #{to_a.inspect}"
  end

end
