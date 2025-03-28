# frozen_string_literal: true

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
  def initialize(*args)
    @first_element = nil
    @last_element = nil
    @length = 0
    self.push(*args) if args.any?
  end

  ######################################################
  # INSTANCE METHODS
  ######################################################
  def first
    @first_element&.object
  end

  def last
    @last_element&.object
  end

  def length
    @length
  end

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

  def select(&block)
    new_list = self.class.new
    self.each do |object|
      new_list.push(object) if !block_given? || block.call(object)
    end
    new_list
  end

  def map(&block)
    result = []
    self.each do |object|
      result << (block_given? ? block.call(object) : object)
    end
    result
  end

  def to_a
    self.map{|x| x}
  end

  def pretty_print
    ap to_a
    nil
  end

end
