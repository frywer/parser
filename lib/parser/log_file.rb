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
  end
end
