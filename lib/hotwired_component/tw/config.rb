# frozen_string_literal: true

module HotwiredComponent
  module Tw
    cattr_accessor :label_classes
    cattr_accessor :input_classes

    def self.configure
      yield self
    end

    self.label_classes = []
    self.input_classes = []
  end
end
