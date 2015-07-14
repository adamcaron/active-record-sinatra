require './test/test_helper'

class CreateTaskTest < Minitest::Test
  include Rack::Test::Methods # allows us to use get, post, last_request, etc.

  def app # def app is something that Rack::Test is looking for
    TaskManager
  end

  def setup # gets run before each test
    DatabaseCleaner.start # starts the process (ie. the transaction)
  end

  def teardown
    DatabaseCleaner.clean # instead of commiting the transaction, it reverses the transaction (rollback)
  end

  # test for a post request to create a task
  # similar to a 'source' wanting to register with the Traffic Spy app.
  def test_create_a_task_with_valid_attributes
    post '/tasks', { task: { title: "something", description: "else", user_id: 1 } } # post '/tasks', { task: { title: "something", description: "else", user_id: 1, status_id: 1 } }
    assert_equal 1, Task.count # count is a method that ActiveRecord gives us
    assert_equal 200, last_response.status
    assert_equal "created!", last_response.body
  end

  # What if someone tries to create a task without a title? (create a resource without the required parameters). Let's validate the data.
  def test_cannot_create_a_task_without_a_title
    post '/tasks', { task: { description: "else", user_id: 1 } }
    assert_equal 0, Task.count
    assert_equal 403, last_response.status
    assert_equal "missing title", last_response.body
  end
end