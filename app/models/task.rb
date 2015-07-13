class Task < ActiveRecord::Base
  # this task takes care of both the instances of the class, and the collection so it's not necessary to have a separate TaskManager class.
  belongs_to :user
end