require("minitest/autorun")
require("minitest/rg")
require_relative("../models/student")
require_relative("../models/house")

class TestStudent < MiniTest::Test

  def setup

    # house_1_details = {
    #   "name" => "Gryffindor",
    #   "logo" => ""
    # }
    # house_2_details = {
    #   "name" => "RavenClaw",
    #   "logo" => ""
    # }

    # house_1 = House.new(house_1_details)
    # house_2 = House.new(house_2_details)

    # house_1.save()
    # house_2.save()

    @house_1 = House.find(1)
    @house_2 = House.find(2)

    student_1_details = {
      "first_name" => "Cho",
      "second_name" => "Chang",
      "house" => @house_1.id,
      "age" => "23"
    }

    student_2_details = {
      "first_name" => "Harry",
      "second_name" => "Potter",
      "house" => @house_2.id,
      "age" => "25"
    }
    student_3_details = {
      "first_name" => "Ron",
      "second_name" => "Weasley",
      "house" => @house_2.id,
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

  def test_find_student_house__id
    student = Student.find(2)
    assert_equal(2,student.house_id.to_i)
  end

  def test_find_student_house__name
    assert_equal("Gryffindor",@student_1.find_house)
  end

end
