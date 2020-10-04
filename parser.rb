# frozen_string_literal: true

require_relative 'lib/parser'
file_path = ARGV[0] || 'webserver.log'

unless File.exist? file_path
  print "Can not find file `#{file_path}`. Make sure the file exists and path is correct.\n"
  print "Need help? Connect with us and we will gladly assist you :) \n"
  return
end

log_file = Parser::Print.new(file_path)
print "---MOST VIEWS---\n"
log_file.print_most_views
print "\n"
print "---UNIQ VIEWS---\n"
log_file.print_uniq_views
print "\n"
print "---VISITOR ACTIVITIES---\n"
log_file.print_visitor_activities
if log_file.log_file.errors.any?
  print "\n"
  print "---Found #{log_file.log_file.errors.count} Errors---\n"
  log_file.print_errors
end
