# frozen_string_literal: true

# Represents element data from List
class List::Element

  ######################################################
  # CONSTRUCTOR
  ######################################################

  # Initialiser of element of list.
  # @param object [Object] Value of list element.
  def initialize(object)
    @object = object
    @previous_element = nil
    @next_element = nil
  end

  ######################################################
  # INSTANCE METHODS
  ######################################################

  # Returns next element into list.
  # @return [List::Element] next element into list.
  def next
    @next_element
  end

  # Sets next element into list.
  # @return [List::Element] next element into list.
  def next=(next_element)
    @next_element = next_element
  end

  # Returns previous element into list.
  # @return [List::Element] previous element into list.
  def previous
    @previous_element
  end

  # Sets previous element into list.
  # @return [List::Element] previous element into list.
  def previous=(previous)
    @previous_element = previous
  end

  # Retrieve element value.
  # @return [Object] value into list element.
  def object
    @object
  end

end
