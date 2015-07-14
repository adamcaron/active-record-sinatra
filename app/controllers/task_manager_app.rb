class TaskManager < Sinatra::Base
  get '/tasks' do
    @tasks = Task.all # prepares data to be psased to .erb view
    erb :tasks_index
  end

  get '/users' do
    @users = User.all
    erb :users_index
  end
end
