# frozen_string_literal: true

module HotwiredComponent
  module Daisy
    ##
    # Displays a flash alert
    class FlashComponent < DaisyComponent
      include Turbo::FramesHelper

      def initialize(flash:)
        super
        @flash = flash
      end

      private

      attr_reader :flash

      def message
        @message ||= flash && (
          flash[:info]       ||
          flash[:success]    ||
          flash[:warning]    ||
          flash[:error]
        )
      end

      def type
        return "info"    if flash[:info]
        return "success" if flash[:success]
        return "warning"    if flash[:warning]

        "error" if flash[:error]
      end
    end
  end
end
