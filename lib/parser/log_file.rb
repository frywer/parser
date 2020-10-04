# frozen_string_literal: true

module Parser
  # Initialize and validates log file
  class LogFile
    class FileMissing < StandardError; end

    def initialize(log_path)
      @log_path = log_path
    end

    def file_exist?
      raise FileMissing, 'File is missing' unless ::File.exist?(@log_path)
    end
  end
end
