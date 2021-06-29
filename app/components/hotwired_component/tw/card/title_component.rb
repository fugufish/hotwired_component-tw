# frozen_string_literal: true

module HotwiredComponent
  module Daisy
    module Card
      class TitleComponent < DaisyComponent
        def initialize(value:)
          super
          @value = value
        end

        private

        attr_reader :value
      end
    end
  end
end
