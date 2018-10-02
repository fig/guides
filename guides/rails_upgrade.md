### !! DO ALL OF THIS IN A NEW BRANCH !!

Change Rails gem version in Gemfile to latest patch of current minor version or, if already at latest patch, latest patch of next minor version. Versioning uses a three-part number, `MAJOR.MINOR.PATCH`

i.e.     **4.2.2    >    4.2.10    >    5.0.7    >    5.1.6**    ...etc

Check versions at https://rubygems.org/gems/rails/versions
It may be neccesary/advisable to upgrade other gems too
It may be neccesary to update the Ruby binary.
Check https://guides.rubyonrails.org/upgrading_ruby_on_rails.html

run `bundle update`

fix any gem dependancies

run `rails app:update`
This will help you with the creation of new files and changes of old files in an interactive session.
Make sure you preview the difference, to see if there are any unexpected changes.

Refer to https://guides.rubyonrails.org/upgrading_ruby_on_rails.html for any changes required to be
made manually.

Run your test suite and fix any deprecation warnings

Open `config/initializers/new_framework_defaults_x_x.rb` and, in conjunction with
https://guides.rubyonrails.org/upgrading_ruby_on_rails.html, incrementally comment out each
config, updating your code as neccessary. Run tests after each config is commented out.

It may be a good idea to keep the `new_framework_defaults_x_x.rb` in your repository, even
after the entire contents are commented out, just in case.

Commit your changes

Now, go back to the top and start again with next minor version.

When you are finally running the latest framework version, run your tests again and check all your gems
are current and free from security warnings. Commit & merge!

Don't leave it so long next time.
