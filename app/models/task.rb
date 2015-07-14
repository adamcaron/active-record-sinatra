class Task < ActiveRecord::Base
  # this task takes care of both the instances of the class, and the collection so it's not necessary to have a separate TaskManager class.
  belongs_to :user
  # belongs_to :status
  validates_presence_of :title # same as `validates :title, presence: true` except the former syntax validates multiple attributes. The latter validates multiple things (title is present, has the correct length etc.) about one attribue (for instance, just the title)
end