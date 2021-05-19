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
            class: css_class(options)
          )
        end

        private

        attr_reader :method, :object, :object_name, :options

        def name
          "#{object_name}[#{method}]"
        end

        def css_class(options)
          ["input", "input-bordered", error_class, options[:class] || ""]
            .join(" ")
            .strip
        end

        def error_class
          "input-error" unless object.errors[method].empty?
        end
      end
    end
  end
end
