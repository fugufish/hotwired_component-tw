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

        def label
          value, opts = extract_label_options(options.delete(:label))

          render(Daisy::Forms::LabelComponent.new(
            method:      method,
            object_name: object_name,
            value:       value,
            options:     opts
          ))
        end

        def error_label
          render(Daisy::Forms::LabelComponent.new(
            method:      method,
            object_name: object_name,
            value:       object.errors[method]&.first,
            alt:         true
          ))
        end

        def css_class(options)
          ["input", "input-bordered", error_class, options[:class] || ""]
            .join(" ")
            .strip
        end

        def error_class
          "input-error" unless object.errors[method].empty?
        end

        def extract_label_options(options)
          value = nil
          opts  = {}

          value = options if options.is_a? String
          opts  = options if options.is_a? Hash
          [value, opts]
        end
      end
    end
  end
end
