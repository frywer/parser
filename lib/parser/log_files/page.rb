# frozen_string_literal: true

module Parser
  module LogFiles
    # Initialize Page object
    class Page < Base
      def uniq_count
        uniq_views.count
      end

      private

      def uniq_views
        @views.uniq(&:ip_address)
      end
    end
  end
end
