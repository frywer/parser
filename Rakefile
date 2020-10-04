# frozen_string_literal: true

task default: [:tests]

task :tests do
  sh 'rspec'
  sh 'rubocop'
end

task :parse do
  ruby "parser.rb #{ENV['path']}"
end
