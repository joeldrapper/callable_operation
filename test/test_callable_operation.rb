# frozen_string_literal: true

require "test_helper"

class TestCallableOperation < Minitest::Test
  class ExampleOperation
    include CallableOperation

    def initialize(positional, keyword:, &block)
      @positional = positional
      @keyword = keyword
      @block = block
    end

    def call
      {
        positional: @positional,
        keyword: @keyword,
        block: @block.call
      }
    end
  end

  def test_that_it_has_a_version_number
    refute_nil ::CallableOperation::VERSION
  end

  def test_call_on_class_instantiates_and_calls_call_on_instance
    assert_equal({ positional: 1, keyword: 2, block: 3 },
      ExampleOperation.call(1, keyword: 2) { 3 })
  end

  def test_to_proc_on_class
    assert_equal({ positional: 1, keyword: 2, block: 3 },
      ExampleOperation.to_proc.call(1, keyword: 2) { 3 })
  end

  def test_instance_to_proc
    operation = ExampleOperation.new(1, keyword: 2) { 3 }

    assert_equal({ positional: 1, keyword: 2, block: 3 },
      operation.to_proc.call)
  end
end
