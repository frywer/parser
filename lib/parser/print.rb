# frozen_string_literal: true

module Parser
  # Prints log views
  class Print
    attr_reader :log_file

    def initialize(log_path)
      @log_file = LogFile.new log_path
    end

    def print_most_views
      pages.each do |page|
        print "#{page.name} #{page.count} visits\n"
      end
    end

    def print_uniq_views
      uniq_views.each do |page|
        print "#{page.name} #{page.uniq_count} unique views\n"
      end
    end

    def print_visitor_activities
      visitors.each do |visitor|
        print "#{visitor.name} #{visitor.count} activities\n"
      end
    end

    def print_errors
      @log_file.errors.each do |error|
        print error
      end
    end

    private

    def uniq_views
      pages.sort_by(&:uniq_count).reverse
    end

    def parsed_file
      @log_file.parse!
      @log_file
    end

    def pages
      @pages ||= parsed_file.pages
    end

    def visitors
      @log_file.visitors
    end
  end
end
