class TaskManager < Sinatra::Base
  get '/tasks' do
    @tasks = Task.all # prepares data to be psased to .erb view
    erb :tasks_index
  end
end
