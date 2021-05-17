# frozen_string_literal: true

require "rails_helper"

RSpec.describe HotwiredComponent::DaisyHelper, type: :helper do
  let(:user) { User.new }

  let(:input_mock) do
    HotwiredComponent::Daisy::Forms::InputComponent.new(
      method:      :email,
      object:      user,
      object_name: :email,
      options:     {}
    )
  end

  describe "#daisy_form_for" do
    it "should render the components using view component" do
      expect(HotwiredComponent::Daisy::Forms::InputComponent).to receive(:new).with({
        object:      user,
        method:      :email,
        object_name: "user",
        options:     { id: "input", value: "test" }
      }).and_return(input_mock)

      helper.daisy_form_for(user, url: "/") do |f|
        f.text_field :email, id: "input", value: "test"
      end
    end
  end
end
