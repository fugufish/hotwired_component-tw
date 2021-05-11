# frozen_string_literal: true

module HotwiredComponent
  module Tw
    module Forms
      class LabelComponent < TwComponent
        def initialize(method:, object_name:, alt: false, value: nil, options: {})
          super
          @method      = method
          @object_name = object_name
          @value       = value
          @options     = options
          @alt         = alt
        end

        private

        attr_reader :method, :object_name, :options, :value

        def content
          super || value || method.to_s.titleize
        end

        def render?
          !alt || alt && value
        end

        def alt
          return nil unless @alt

          "-alt"
        end
      end
    end
  end
end
