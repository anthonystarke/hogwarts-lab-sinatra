require('pg')
require_relative('../db/sql_runner')

class House

  attr_reader :id, :name, :logo

  def initialize(options)
    @id = options['id'].to_i if options['id'].to_i
    @name = options['name']
    @logo = options['logo']
  end

  def save
    sql = "INSERT INTO houses (name, logo) VALUES ($1, $2) RETURNING id"
    values = [@name, @logo]
    @id = SqlRunner.run(sql, values)[0]['id']
  end

  def self.find(id)
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)[0]
    return House.new(result)
  end

  def self.find_all()
    sql = "SELECT * FROM houses"
    values = []
    result = SqlRunner.run(sql, values)
    return result.map { |house| House.new(house) }
  end

  def self.delete(id)
    sql = "DELETE * FROM houses WHERE id = $1"
    values = [id]
    SqlRunner.run(sql,values)
  end

  def self.delete_all()
    sql = "DELETE FROM houses"
    values = []
    SqlRunner.run(sql,values)
  end
end
