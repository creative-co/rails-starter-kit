def source_paths
  [File.expand_path(File.dirname(__FILE__))]
end

def get_from_repo(filename)
  repo = "https://raw.githubusercontent.com/cloudcastle/rails-starter-kit/master/"
  repo = "" if ENV["DEBUG"]
  get repo + filename, filename
end

gem_group :development, :test do
 gem 'pronto'
 gem 'pronto-rubocop', require: false
 gem 'pronto-flay', require: false
 gem 'pronto-brakeman', require: false
 gem 'pronto-dirty_words', require: false
 gem 'pronto-fasterer', require: false
 gem 'pronto-rails_best_practices', require: false
 gem 'pronto-rails_schema', require: false
 gem 'pronto-slim', require: false
 gem 'pronto-scss', require: false
end

get_from_repo ".rubocop.yml"

