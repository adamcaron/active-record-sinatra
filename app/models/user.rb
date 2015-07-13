class User < ActiveRecord::Base
  has_many :tasks # this is a method that takes an argument (:tasks) ... Adds a method that goes and looks in the tasks table
end