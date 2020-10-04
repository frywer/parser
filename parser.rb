# frozen_string_literal: true

require_relative 'lib/parser'

log_file = Parser::Print.new(ARGV[0])
print "---MOST VIEWS---\n"
log_file.print_most_views
print "\n"
print "---UNIQ VIEWS---\n"
log_file.print_uniq_views
if log_file.log_file.errors.any?
  print "\n"
  print "---Found #{log_file.log_file.errors.count} Errors---\n"
  log_file.print_errors
end
