require_relative './config/environment'

# if ActiveRecord::Migrator.needs_migration?
#     raise 'Migration is pending.  Run `rake db:migrate` to solve this.' 
# end

if ActiveRecord::Base.connection.migration_context.needs_migration?
    raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
  end

use Rack::MethodOverride
use UsersController
use MoviesController
run ApplicationController