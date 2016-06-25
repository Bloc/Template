# Bloc Rails application template

Use this template to spawn new applications at Bloc.

## Usage

```
$ rails new myapp -m https://raw.githubusercontent.com/Bloc/Template/master/template.rb
```

## TODO

[Sitepoint reference](https://www.sitepoint.com/rails-application-templates-real-world/)

[Thor reference](https://www.sitepoint.com/introduction-thor/)

- Ruby 2.1.7
- remove spring
- environment variables
- session sharing
- webpack config
- Frontend stack: Angular 1.4.7 or React + Alt.js (?)
- data
- database configuration:

```
$ bin/rake db:create
$ bin/rake db:schema:load
```

- app.json for easy heroku deployment
- instructions for transferring ownership to bloc:
```
$ heroku create my-app
$ heroku sharing:add accounts@trybloc.com -a my-app
```

Then, transfer ownership via the heroku dashboard. [More info here](https://devcenter.heroku.com/articles/transferring-apps).
- ahoy
- rollbar
- newrelic
