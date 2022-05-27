# frozen_string_literal: true
module Callable
  def call
    raise NoMethodError
  end

  def to_proc
    method(:call).to_proc
  end
end
