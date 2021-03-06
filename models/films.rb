require('pg')
require('pry')

require_relative('../db/sql_runner.rb')

class Film
  attr_reader :id
  attr_accessor :title,:price,:showings,:tickets

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price'].to_i
    @showings = options['showings']
    @tickets = options['tickets'].to_i
  end

  def save()
    sql = '
    INSERT INTO films
    (title,price)
    VALUES
    ($1,$2)
    RETURNING id'
    result = SqlRunner.run(sql,[@title,@price])
    @id = result[0]['id'].to_i


    @showings.each do |showtime|
      update_id = @id.to_i
      # p "Film Id: #{@id} | Show time: #{showtime} | Tickets: #{@tickets}"
      # p "============================="
      sql = '
        INSERT INTO screenings
        (film_id,screening,ticket_no)
        VALUES ($1,$2,$3)
      '
      # binding.pry
      SqlRunner.run(sql,[update_id,showtime,@tickets])
    end
  end

  def self.delete_all
    sql = 'DELETE FROM films'
    SqlRunner.run(sql)
  end

  def delete()
    sql = 'DELETE FROM films WHERE id = $1'
    SqlRunner.run(sql,[@id])
  end

  def self.all()
    sql = 'SELECT * FROM films'
    results = SqlRunner.run(sql)
    return results.map do |result|
      result
    end
  end

  def find()
    sql = 'SELECT * FROM films WHERE id = $1'
    return SqlRunner.run(sql,[@id]).to_a
  end

  def update()
    sql = '
      UPDATE films
      SET
      title = $1,
      price = $2
      WHERE id = $3
    '
    SqlRunner.run(sql,[@title,@price,@id])
  end

  def viewers()
    # Who is watching this film
    sql = '
    SELECT customers.name
    FROM customers
    INNER JOIN tickets
    ON customers.id = tickets.customer_id
    INNER JOIN films
    ON tickets.film_id = films.id
    WHERE films.id = $1
    '

    results = SqlRunner.run(sql,[@id])
    return results.map{|result| result['name']}
  end

  def viewcount()
    total = self.viewers.count
    p "#{total} people have booked this film"
  end

  def popular()
    # sql = 
  end
end
