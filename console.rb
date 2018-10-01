require('pry')
require_relative('./models/customers.rb')
require_relative('./models/films.rb')
require_relative('./models/tickets.rb')
require_relative('./models/showings.rb')
require_relative('./data.rb')

# Remove existing DB data and replace it
clear_db()
create_data()

binding.pry
nil
