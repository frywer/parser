# frozen_string_literal: true

module Parser
  module LogFiles
    # Base class for Log File objects
    class Base
      attr_reader :name, :count

      def initialize(name, views)
        @name = name
        @views = views
        @count = @views.count
      end
    end
  end
end
