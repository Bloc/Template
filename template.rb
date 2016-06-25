# Add the current directory to the path Thor uses
# to look up files
def source_paths
  Array(super) +
    [File.expand_path(File.dirname(__FILE__))]
end


remove_file "Gemfile"
run "touch Gemfile"
add_source 'https://rubygems.org'

gem 'rails', '4.1'
gem "pg"
gem 'sass-rails', '~> 4.0.3'
gem 'puma'
gem 'font-awesome-sass'
gem 'active_model_serializers'

gem_group :development, :test do
  gem 'pry-rails'
  gem 'pry-remote'
  gem 'pry-stack_explorer'
  gem 'pry-nav'
  gem 'foreman'
  gem 'spring'
end

