# frozen_string_literal: true

module HotwiredComponent
  module Tw
    class InstallGenerator < Rails::Generators::NamedBase
      source_root File.expand_path("templates", __dir__)

      def install_hotwired_component
        generate "hotwired_component:install"
      end

      def install_tailwind
        rake "tailwindcss:install"
      end
    end
  end
end
