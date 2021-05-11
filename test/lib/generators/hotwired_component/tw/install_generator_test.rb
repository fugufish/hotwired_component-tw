require "test_helper"
require "generators/hotwired_component/tw/install/install_generator"

class HotwiredComponent::Tw::InstallGeneratorTest < Rails::Generators::TestCase
  tests HotwiredComponent::Tw::InstallGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
