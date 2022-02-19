# lib/tasks/routes.rake

# In memory of Jim Weirich
# Hat-tip to Walter Davis of 'Ruby on Rails Link' Slack server.

require "rails/command"
desc "Print out all defined routes in match order, with names."
task routes: :environment do
  Rails::Command.invoke "routes"
end
