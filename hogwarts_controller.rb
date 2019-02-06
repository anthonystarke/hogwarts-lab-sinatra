require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/hogwarts')
also_reload('./models/*')

get '/all-students' do
  @students = Student.all()
  erb (:index)
end

get '/create-student' do
  erb (:new)
end

post '/create-student' do
  new_student = Student.new(params)
  new_student.save()
  redirect to '/all-students'
end
