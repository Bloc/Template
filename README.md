# Bloc Rails application template

Use this template to spawn new applications at Bloc.

## Usage

```
$ rails new myapp -m https://raw.githubusercontent.com/Bloc/Template/master/template.rb
```

## TODO

[Sitepoint reference](https://www.sitepoint.com/rails-application-templates-real-world/)

[Thor reference](https://www.sitepoint.com/introduction-thor/)

### New Gemfile & other dependencies

- Ruby 2.1.7
- Rails 4.1
- Postgres
- foreman and .env files

### Session sharing w/ Bloc

- include instructions for setting environment variables

### Frontend

- webpack config
- Frontend stack: Angular 1.4.7 or React + Alt.js (?)

### Configure & Create DB

```
$ bin/rake db:create
$ bin/rake db:schema:load
```

### Set up default Procfile and script/dev_server

```
$ bundle install
$ bin/rails s
```

### app.json for easy heroku deployment

```
$ heroku create my-app
$ heroku sharing:add accounts@trybloc.com -a my-app
```

Then, transfer ownership via the heroku dashboard. [More info here](https://devcenter.heroku.com/articles/transferring-apps).

### Ahoy

TODO

### Rollbar

TODO

### New Relic

TODO



