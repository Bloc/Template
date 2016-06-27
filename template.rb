# Add the current directory to the path Thor uses
# to look up files
def source_paths
  Array(super) +
    [File.expand_path(File.dirname(__FILE__))]
end

def configure_database
  inside 'config' do
    remove_file 'database.yml'
    create_file 'database.yml' do <<-EOF
common: &common
  adapter: postgresql
  username: admin
  host: localhost
  pool: 5

development:
  <<: *common
  database: #{app_name}_development

test: &test
  <<: *common
  database: #{app_name}_test

production:
  <<: *common
  database: #{app_name}_production

profiling:
  <<: *common
  database: #{app_name}_profile

EOF
    end
    
  end
end

def gemfile
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
end

def configure_frontend
  create_file 'package.json' do <<-EOF
{
  "name": "#{app_name}",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "directories": {
    "test": "test"
  },
  "dependencies": {
    "alt": "^0.18.4",
    "autoprefixer-loader": "^3.2.0",
    "axios": "^0.12.0",
    "babel-core": "^6.9.1",
    "babel-loader": "^6.2.4",
    "babel-preset-es2015": "^6.9.0",
    "babel-preset-react": "^6.5.0",
    "css-loader": "^0.23.1",
    "json-loader": "^0.5.4",
    "lodash": "^4.13.1",
    "moment": "^2.13.0",
    "moment-timezone": "^0.5.4",
    "node-sass": "^3.8.0",
    "react": "^15.1.0",
    "react-dom": "^15.1.0",
    "react-router": "^2.4.1",
    "sass-loader": "^3.2.1",
    "style-loader": "^0.13.1",
    "webpack": "^1.13.1",
    "webpack-validator": "^2.2.0"
  },
  "devDependencies": {},
  "scripts": {
    "test": "echo \\"Error: no test specified\\" && exit 1"
  }
}
EOF
  end
end

def main
  gemfile

  # Server
  copy_file 'Procfile'
  copy_file 'Procfile.dev'
  empty_directory 'script'
  inside 'script' do
    copy_file 'dev_server'
    run 'chmod a+x dev_server'
  end

  configure_database
  configure_frontend

  after_bundle do
    run 'rake db:create'
    run 'npm install'
  end

end

main()

