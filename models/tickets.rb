require('pg')
require('pry')

require_relative('../db/sql_runner.rb')

class Ticket
  attr_reader :id,:film_id,:customer_id

  def initialize(options)
    @id = options['id'].to_i
    @film_id = options['film_id'].to_i
    @customer_id = options['customer_id'].to_i
  end

  def save()
    sql = '
    INSERT INTO tickets
    (film_id,customer_id)
    VALUES
    ($1,$2)
    RETURNING id'
    result = SqlRunner.run(sql,[@film_id,@customer_id])
    @id = result[0]['id'].to_i
  end

  def self.delete_all
    sql = 'DELETE FROM tickets'
    SqlRunner.run(sql)
  end
end
