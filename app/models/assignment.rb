class Assignment < ActiveRecord::Base
  belongs_to :homework
  belongs_to :student

  validates_presence_of :homework, :student
end