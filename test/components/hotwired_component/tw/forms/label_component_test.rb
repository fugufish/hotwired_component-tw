# frozen_string_literal: true

require "view_component/test_case"

module HotwiredComponent
  module Tw
    module Forms
      class LabelComponentTest < ViewComponent::TestCase
        def test_renders_the_label
          render_inline(LabelComponent.new(
            method:      :email,
            object_name: "user",
            value:       nil
          ))

          assert_selector(
            "label.daisy-forms-label.label" \
            "[data-controller='daisy--forms--label--component']" \
            "> span.label-text"
          )
        end
      end
    end
  end
end
