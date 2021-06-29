# frozen_string_literal: true

module HotwiredComponent
  module Tw
    cattr_accessor :label_classes
    cattr_accessor :input_classes
    cattr_accessor :submit_button_classes

    def self.configure
      yield self
    end

    self.label_classes         = []
    self.input_classes         = []
    self.submit_button_classes = []
  end
end
