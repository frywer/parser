# frozen_string_literal: true

module Parser
  # Web site visitor object
  class Visitor
    attr_reader :ip_address

    def initialize(ip_address, views)
      @ip_address = ip_address
      @views = views
    end

    def activities_count
      @views.count
    end
  end
end
