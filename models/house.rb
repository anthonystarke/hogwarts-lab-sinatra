require('pg')
require_relative('../db/sql_runner')

class House

  attr_reader :id, :name, :logo

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @logo = options['logo']
  end

  def save
    sql = "INSERT INTO houses (name, logo) VALUES ($1, $2) RETURNING id"
    values = [@name, @logo]
    SqlRunner.run(sql, values)
  end

end
