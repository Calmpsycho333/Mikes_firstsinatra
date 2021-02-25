require_relative './config/environment'

# if ActiveRecord::Migrator.needs_migration?
#     raise 'Migration is pending.  Run `rake db:migrate` to solve this. ' 
# end

use Rack::MethodOverride
run ApplicationController