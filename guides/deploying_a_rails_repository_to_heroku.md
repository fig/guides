## Deploying a Rails repository to Heroku

### Ensure you have Heroku CLI installed locally.
See https://devcenter.heroku.com/articles/heroku-cli for installation instructions.
To verify your CLI installation, use the `heroku --version` command:
```sh
$ heroku --version
heroku/7.0.0 (darwin-x64) node-v8.0.0
```

You should see `heroku/x.y.z` in the output. If you don’t, but you have installed the Heroku CLI, it’s possible you have an old `heroku` gem on your system. Uninstall it with [these instructions](https://devcenter.heroku.com/articles/heroku-cli#uninstalling-the-legacy-heroku-gem).

### Log in to Heroku

Run the `heroku login` command to log in with your Heroku account credentials:

```sh
$ heroku login
Enter your Heroku credentials.
Email: adam@example.com
Password (typing will be hidden):
Authentication successful.
```

### Create the Heroku app

At this stage you will want to choose the Heroku region. Unless a different region is specified, apps in the Common Runtime will be created in the `us`region. See the [Common Runtime documentation](https://devcenter.heroku.com/articles/dyno-runtime#common-runtime) to see the list of supported regions.

You may also want to give your app a sensible name instead of the whacky one (such as `calm-ocean-1234) ` that heroku will give you.

```sh
$ heroku apps:create [sensible_name] [--region eu]
Creating calm-ocean-1234... done, region is eu
http://sensible_name.herokuapp.com/ | git@heroku.com:sensible_name.git
Git remote heroku added
```

### Set your environment variables on Heroku

If you are using Rails >= 5.2 and are using [Rails Encrypted Credentials](https://guides.rubyonrails.org/v5.2/security.html#custom-credentials). Find your master key in `config/master.key`and set it as an environment variable on Heroku -

```shell
$ heroku config:set RAILS_MASTER_KEY=5d1777d2543753a920176982b7cb60d5
```

Some features such as ActiveStorage and ActionMailer require the host url to be set in environment configs.
To access the host URL from inside your app set an environment variable -

```shell
$ heroku config:set HOST_URL=$(heroku info -s | grep web_url | cut -d= -f2)
```
You can now set `default_url_options` and `action_mailer.default_url_options` for production environment

```ruby
# config/environment/production.rb

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Fetch the host url from Heroku env vars
  config.default_url_options = { host: ENV["HOST_URL"] }
  config.action_mailer.default_url_options = { host: ENV["HOST_URL"] }
  
  ...
  
end  
```

If you are using environment variables for sensitive data in your codebase, you will need to add them individually to Heroku in a similar manner.

### Deploy your code

Everything should be set to deploy your code and launch your app. To deploy your app to Heroku, you typically use the `git push` command to push the code from your local repository’s `master` branch to your `heroku` remote, like so:

```shel
$ git push heroku master
Initializing repository, done.
updating 'refs/heads/master'
...
```

### Migrate your database

If you are using the database in your application, you need to manually migrate the database by running:

```shell
$ heroku run rake db:migrate
```

Check the logs for any issues.
