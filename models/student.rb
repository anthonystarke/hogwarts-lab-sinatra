require('pg')
require_relative('../db/sql_runner')

class Student

  attr_reader :id, :first_name, :second_name, :house_id, :age

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @second_name = options['second_name']
    @house_id = options['house_id'].to_i
    @age = options['age'].to_i
  end

  def find_house
    sql = "SELECT name FROM houses
          INNER JOIN students
          on houses.id = students.house_id
          WHERE students.id = $1"
    values =[@id]
    result = SqlRunner.run(sql,values)[0]
    return House.new(result)
  end

  def save
    sql = "INSERT INTO students (first_name, second_name, house_id, age) VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@first_name, @second_name, @house_id, @age]
    @id = SqlRunner.run(sql, values)[0]['id']
  end

  def self.find_all()
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

  def self.delete(id)
    sql = "DELETE FROM students WHERE id = $1"
    values = [id]
    SqlRunner.run(sql,values)
  end

  def self.delete_all
    sql = "DELETE FROM students"
    values = []
    SqlRunner.run(sql,values)
  end
end
