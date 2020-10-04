# frozen_string_literal: true

require_relative 'lib/parser'

log_file = Parser::Print.new(ARGV[0])
print "---MOST VIEWS---\n"
log_file.most_views
print "---UNIQ VIEWS---\n"
log_file.uniq_views
