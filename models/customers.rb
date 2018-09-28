require('pg')
require('pry')

require_relative('../db/sql_runner.rb')

class Customer
  attr_reader :id
  attr_accessor :name,:funds

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = '
    INSERT INTO customers
    (name,funds)
    VALUES
    ($1,$2)
    RETURNING id'
    result = SqlRunner.run(sql,[@name,@funds])
    @id = result[0]['id'].to_i
  end

  def self.delete_all
    sql = 'DELETE FROM customers'
    SqlRunner.run(sql)
  end

  def delete()
    sql = 'DELETE FROM customers WHERE id = $1'
    SqlRunner.run(sql,[@id])
  end

  def self.all()
    sql = 'SELECT * FROM customers'
    results = SqlRunner.run(sql)
    return results.map do |result|
      result
    end
  end

  def find()
    sql = 'SELECT * FROM customers WHERE id = $1'
    return SqlRunner.run(sql,[@id]).to_a
  end
end
