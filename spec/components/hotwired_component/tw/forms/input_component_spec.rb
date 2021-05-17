# frozen_string_literal: true

require "rails_helper"
RSpec.describe HotwiredComponent::Daisy::Forms::InputComponent, type: :view do
  let(:object) { User.new }
  let(:method) { :email }
  let(:object_name) { nil }
  let(:label) { nil }

  let(:default_options) do
    {
      method:      method,
      object:      object,
      object_name: object_name,
      options:     {}
    }
  end

  let(:label) { double(HotwiredComponent::Daisy::Forms::LabelComponent) }

  subject { described_class.new(**default_options) }

  describe "render" do
    it "should render the input with labels" do
      expect(HotwiredComponent::Daisy::Forms::LabelComponent).to receive(:new)
        .twice.and_return(label)

      expect(subject).to receive(:render).twice.with(label).and_return("")

      render(subject)

      expect(rendered).to have_css(
        ".daisy-forms-input.form-control" \
        "[data-controller='daisy--forms--input--component']" \
        "> input[type='text'][name='[email]']"
      )
    end
  end

  describe "#label" do
    before :each do
      allow(HotwiredComponent::Daisy::Forms::LabelComponent).to receive(:new).and_return(label)
      allow(subject).to receive(:render).and_return("")
    end

    it "should render the label" do
      expect(HotwiredComponent::Daisy::Forms::LabelComponent).to receive(:new)
        .at_least(:once)
        .with({
          method:      method,
          object_name: object_name,
          value:       nil,
          options:     {}
        })

      render(subject)
    end
  end

  describe "#error_label" do
    before :each do
      allow(HotwiredComponent::Daisy::Forms::LabelComponent).to receive(:new).and_return(label)
      allow(subject).to receive(:render).and_return("")
    end

    it "should render the label" do
      expect(HotwiredComponent::Daisy::Forms::LabelComponent).to receive(:new)
        .at_least(:once)
        .with({
          method:      method,
          object_name: object_name,
          value:       nil,
          alt:         true
        })

      render(subject)
    end
  end
end
