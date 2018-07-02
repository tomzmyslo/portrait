if %w[development test].include? Rails.env
  require 'rubocop/rake_task'

  RuboCop::RakeTask.new

  task(:default).clear
  task default: %i[spec rubocop eslint]
end

task :eslint do
  sh './node_modules/.bin/eslint ./app/javascript'
end
