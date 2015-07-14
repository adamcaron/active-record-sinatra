class TaskManager < Sinatra::Base
  get '/tasks' do
    @tasks = Task.all # prepares data to be psased to .erb view
    erb :tasks_index
  end

  get '/users' do
    @users = User.all
    erb :users_index
  end

  post '/tasks' do
    task = Task.new(params[:task])
    if task.save # checks that the new ruby object is an acceptable object to be saved into database. (checks against the validation in the task model)
      # if the ruby object is valid, return response 'created'
      body   "created!"
    else
      # if the ruby object is not valid, return status 403 and body message
      status 403 # status(403) ... just a method with params
      body   task.errors.full_messages.join(", ") # full_messages returns an array, so this takes separates those elements with commas
    end
  end

  # Refactor:
  # post '/tasks' do
  #   task_creator = TaskCreator.new(params[:task])
  #   status task_creator.status
  #   body   task_creator.body
  # end

  # Ruby Land
  # task.new doesn't give it an id because it doesn't save it in the database.
  # t = task.new
  # t.new_record? => true ... becuase it hasn't been saved into the database.
  # t.save will add it to the database and t will have an id.
  # 'new' + 'save' together equal 'create'
  #
  # Database Land
  # task.create
end
