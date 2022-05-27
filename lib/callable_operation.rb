# frozen_string_literal: true

require_relative "callable"
require_relative "callable_operation/version"

module CallableOperation
  include Callable

  module ClassMethods
    include Callable

    def call(*args, **kwargs, &block)
      new(*args, **kwargs, &block).call
    end
  end

  def self.included(klass)
    klass.extend(ClassMethods)
  end
end
