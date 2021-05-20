# frozen_string_literal: true

module HotwiredComponent
  module Tw
    module Forms
      class InputComponent < TwComponent
        def initialize(method:, object:, object_name:, options:)
          super
          @method      = method
          @content     = content
          @object      = object
          @object_name = object_name
          @options     = options.merge(
            id:    "#{object_name}_#{method}",
            name:  "#{object_name}[#{method}]",
            class: css_classes(options.delete(:class))
          )
        end

        private

        attr_reader :method, :object, :object_name, :options

        def name
          "#{object_name}[#{method}]"
        end

        def css_classes(additional)
          (["hotwired-component-tw-input"] + Tw.input_classes + [additional])
            .compact
            .join(" ")
        end

        def error_class
          "input-error" unless object.errors[method].empty?
        end
      end
    end
  end
end
