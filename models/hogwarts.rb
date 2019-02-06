require('pg')
require_relative('../db/sql_runner')

class Student

  attr_reader :id, :first_name, :second_name, :house, :age

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @second_name = options['second_name']
    @house_id = options['house_id']
    @age = options['age']
  end

  def save
    sql = "INSERT INTO students (first_name, second_name, house_id, age) VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@first_name, @second_name, @house_id, @age]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM students"
    values = []
    result = SqlRunner.run(sql, values)
    return result.map { |student| Student.new(student) }
  end

  def self.find(id)
    sql = "SELECT * FROM students WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)[0]
    return Student.new(result)
  end

end
