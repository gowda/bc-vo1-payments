# frozen_string_literal: true

unless Rails.env.production?
  begin
    require 'rubocop/rake_task'
    RuboCop::RakeTask.new(:cop)
  rescue LoadError => e
    abort "Could not load rubocop tasks: #{e.inspect}"
  end
end
