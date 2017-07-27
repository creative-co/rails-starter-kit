def get_from_repo(filename)
  repo = "https://raw.githubusercontent.com/cloudcastle/rails-starter-kit/master/"
  get repo + filename, filename
end

gem_group :development, :test do
 gem 'rubocop', require: false
end

get_from_repo ".rubocop.yml"

