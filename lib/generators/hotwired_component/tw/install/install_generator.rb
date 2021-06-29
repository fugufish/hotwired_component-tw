# frozen_string_literal: true

module HotwiredComponent
  module Tw
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)

      def install_hotwired_component
        generate "hotwired_component:install"
      end

      def install_tailwind
        run "rails tailwindcss:install"
      end

      def create_intializer
        initializer "tw_theme.rb" do
          "HotwiredComponent::Tw.configure do |config|\nend"
        end
      end
    end
  end
end
