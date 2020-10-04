# frozen_string_literal: true

module Parser
  # Parse log file row
  class View
    class InvalidRow < StandardError; end
    ROW_REGEXP = '(?<page>\/\S*) (?<ip_address>(?:[0-9]{1,3}\.){3}[0-9]{1,3}$)'

    def initialize(row)
      @row = row # /help_page/1 382.335.626.855
    end

    def page
      parse[:page]
    end

    def ip_address
      parse[:ip_address]
    end

    def validate!
      ip_address && page || raise(InvalidRow, "Row: #{@row} is invalid!")
    end

    private

    def parse
      @parse ||= @row.match(/#{ROW_REGEXP}/) || {}
    end
  end
end
