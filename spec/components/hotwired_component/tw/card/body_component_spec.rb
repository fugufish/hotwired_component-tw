# frozen_string_literal: true

require "rails_helper"

RSpec.describe HotwiredComponent::Daisy::Card::BodyComponent, type: :view do
  subject do
    described_class.new
  end

  describe "render" do
    let(:title) { double(HotwiredComponent::Daisy::Card::TitleComponent, render_in: "title") }

    it "should render the body" do
      expect(HotwiredComponent::Daisy::Card::TitleComponent).to receive(:new)
        .with(value: "foo")
        .and_return(title)

      render(subject) do |b|
        b.title value: "foo"
        "this is the body"
      end

      expect(rendered).to have_css(
        ".card-body" \
        "[data-controller='card--body--component']"
      )

      expect(rendered).to have_text("this is the body")
      expect(rendered).to have_text("title")
    end
  end
end
