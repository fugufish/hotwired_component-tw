# frozen_string_literal: true

require "rails_helper"

RSpec.describe HotwiredComponent::Daisy::Card::TitleComponent, type: :view do
  subject { described_class.new(value: "Sign Up") }
  describe "render" do
    it "should render the component" do
      render(subject)

      expect(rendered).to have_css(
        ".card-title[data-controller='card--title--component']" \
        "> h1"
      )

      expect(rendered).to have_text("Sign Up")
    end
  end
end
