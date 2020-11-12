require './config/environment'


if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

require 'sass/plugin/rack'

use Sass::Plugin::Rack
use Rack::MethodOverride
use SessionsController
use UsersController
use EventsController
run ApplicationController
