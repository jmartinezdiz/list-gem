# frozen_string_literal: true

require "test_helper"

describe ::List do

  it 'has version number' do
    refute_nil ::List::VERSION
  end

  it 'check constructor' do
    list = ::List.new
    assert_nil list.first
    assert_nil list.last
    assert_equal list.length, 0
    list = ::List.new(1, 2, 3)
    assert_equal list.first, 1
    assert_equal list.last, 3
    assert_equal list.length, 3
  end

  it 'check unsift' do
    list = ::List.new
    list.unsift(1)
    assert_equal list.first, 1
    assert_equal list.last, 1
    assert_equal list.length, 1
    list.unsift(2, 3)
    assert_equal list.first, 3
    assert_equal list.last, 1
    assert_equal list.length, 3
  end

  it 'check push' do
    list = ::List.new
    list.push(1)
    assert_equal list.first, 1
    assert_equal list.last, 1
    assert_equal list.length, 1
    list.push(2, 3)
    assert_equal list.first, 1
    assert_equal list.last, 3
    assert_equal list.length, 3
  end

  it 'check each' do
    list = ::List.new
    assert_equal list.each, list
    assert_equal list.each{|x| x + 1}, list
    list = ::List.new(1,2,3)
    assert_equal list.each, list
    assert_equal list.each{|x| x + 1}, list
  end

  it 'check select' do
    list = ::List.new
    assert_equal list.select.to_a, []
    assert_equal list.select{|x| x + 1}.to_a, []
    list = ::List.new(1,2,3)
    assert_equal list.select.to_a, [1, 2, 3]
    assert_equal list.select{|x| x > 1}.to_a, [2, 3]
  end

  it 'check map' do
    list = ::List.new
    assert_equal list.map, []
    assert_equal list.map{|x| x + 1}, []
    list = ::List.new(1,2,3)
    assert_equal list.map, [1, 2, 3]
    assert_equal list.map{|x| x + 1}, [2, 3, 4]
  end

  it 'check to_a' do
    list = ::List.new
    assert_equal list.to_a, []
    list.push(1)
    assert_equal list.to_a, [1]
    list.push(2, 3)
    assert_equal list.to_a, [1, 2, 3]
  end

end