require_relative('../models/hogwarts')
require_relative('../models/house')

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

house_1_details = {
  "name" => "Gryffindor",
  "logo" => ""
}

house_2_details = {
  "name" => "Ravenclaw",
  "logo" => ""
}

house_3_details = {
  "name" => "Hufflepuff",
  "logo" => ""
}

house_4_details = {
  "name" => "Slytherin",
  "logo" => ""
}

house_1 = House.new(house_1_details)
house_2 = House.new(house_2_details)
house_3 = House.new(house_3_details)
house_4 = House.new(house_4_details)

house_1.save()
house_2.save()
house_3.save()
house_4.save()

student_1 = Student.new(student_1_details)
student_2 = Student.new(student_2_details)
student_3 = Student.new(student_3_details)

student_1.save()
student_2.save()
student_3.save()
