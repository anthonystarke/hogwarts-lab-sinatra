require("minitest/autorun")
require("minitest/rg")
require_relative("../models/hogwarts")

class TestStudent < MiniTest::Test

  def setup
    student_1_details = {
      "first_name" => "Cho",
      "second_name" => "Chang",
      "house" => "Ravenclaw",
      "age" => "23"
    }

    student_2_details = {
      "first_name" => "Harry",
      "second_name" => "Potter",
      "house" => "Gryffindor",
      "age" => "25"
    }
    student_3_details = {
      "first_name" => "Ron",
      "second_name" => "Weasley",
      "house" => "Gryffindor",
      "age" => "26"
    }

    @student_1 = Student.new(student_1_details)
    @student_2 = Student.new(student_2_details)
    @student_3 = Student.new(student_3_details)

  end

  def test_student_first_name
    assert_equal("Cho", @student_1.first_name)
  end

  def test_find
    student = Student.find(2)
    assert_equal("Harry", student.first_name)
  end

end
