# frozen_string_literal: true

module Parser
  # Initialize Page object
  class Page
    attr_reader :name, :count

    def initialize(name, views)
      @name = name
      @views = views
      @count = @views.count
    end

    def uniq_count
      uniq_views.count
    end

    private

    def uniq_views
      @views.uniq(&:ip_address)
    end
  end
end
