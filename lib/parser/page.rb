# frozen_string_literal: true

module Parser
  # Initialize Page object
  class Page
    def initialize(name, views)
      @name = name
      @views = views
    end

    def uniq_views
      @views.uniq(&:ip_address)
    end

    def count
      @views.count
    end

    def uniq_count
      uniq_views.count
    end
  end
end
