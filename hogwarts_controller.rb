require('sinatra')
require('sinatra/contrib/all')
require_relative('./models/student')
require_relative('./models/house')
also_reload('./models/*')

get '/all-students' do
  @students = Student.find_all()
  erb (:index)
end

get '/create-student' do
  @houses = House.find_all()
  erb (:new)
end

get '/all-houses' do
  @houses = House.find_all()
  erb(:index_house)
end

post '/create-student' do
  new_student = Student.new(params)
  new_student.save()
  redirect to '/all-students'
end


post '/delete/:id' do
  Student.delete(params[:id])
  redirect to '/all-students'
end
