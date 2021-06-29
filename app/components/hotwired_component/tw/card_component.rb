# frozen_string_literal: true

module HotwiredComponent
  module Tw
    class CardComponent < TwComponent
      renders_one :body, Card::BodyComponent

      def initialize(options = {})
        super
        @class = options.merge(
          class: css_classes(options.delete(:class))
        )
      end

      private

      def css_classes(additional)
        (["hotwired-component-tw-card"] + Tw.card_classes + [additional])
          .compact
          .join
      end
    end
  end
end
