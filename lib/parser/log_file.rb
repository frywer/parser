# frozen_string_literal: true

module Parser
  # Initialize and parse log file
  class LogFile
    class FileMissing < StandardError; end

    attr_reader :views, :errors

    def initialize(log_path)
      @log_path = log_path
      @errors = []
      @views = []
    end

    def parse
      ::File.readlines(@log_path).each do |row|
        view = View.new(row)
        view.validate!
        @views << view
      rescue View::InvalidRow => e
        @errors << e.message
      end
    end

    def parse!
      raise(FileMissing, 'File is missing!') unless ::File.exist?(@log_path)

      parse
    end

    def pages
      @pages ||= @views
                 .group_by(&:page)
                 .map { |page, views| Page.new(page, views) }
    end

    # def sorted_pages
    #   pages.sort_by(&:count)
    # end
    #
    # def sorted_uniq_pages
    #   pages.sort_by(&:uniq_count)
    # end
  end
end
