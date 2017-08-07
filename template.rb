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

gem 'dotenv-rails', group: [:development, :test]
create_file ".env", "# NOT FOR SENSITIVE INFORMATION - Override .env.local instead."
create_file ".env.local", ""
append_file ".gitignore", ".env.local\n"

insert_into_file "Gemfile", "ruby '#{RUBY_VERSION}'\n", before: /^ *gem 'rails'/, force: false
append_file ".gitignore", ".ruby-version\n"
create_file ".ruby-version", "#{RUBY_VERSION}\n"

get_from_repo "Procfile"

gem 'rack-canonical-host'
insert_into_file "config.ru", before: /^ *run Rails.application/, force: false do <<-LINE
use Rack::CanonicalHost, ENV['CANONICAL_HOST'], cache_control: 'no-cache' if ENV['CANONICAL_HOST']
LINE
end

get_from_repo ".editorconfig"
