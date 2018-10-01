require('pg')
require('pry')

require_relative('../db/sql_runner.rb')

class Showing
  attr_reader
  attr_accessor

  def initialize(options)
    @id = options['id'].to_i
    @film_id = options['film_id'].to_i
    @screening = options['screening'].to_i
    @ticket_no = options['ticket_no'].to_i
  end

  
end
