# frozen_string_literal: true

class List::Element

  ######################################################
  # CONSTRUCTOR
  ######################################################
  def initialize(object)
    @object = object
    @previous_element = nil
    @next_element = nil
  end

  ######################################################
  # INSTANCE METHODS
  ######################################################

  def next
    @next_element
  end

  def next=(next_element)
    @next_element = next_element
  end

  def previous
    @previous_element
  end

  def previous=(previous)
    @previous_element = previous
  end

  def object
    @object
  end

end
