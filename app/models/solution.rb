class Solution < ActiveRecord::Base
  belongs_to :student
  belongs_to :homework

  validates_presence_of :student, :homework, :answer

  before_validation :set_version

  def set_version
    self.version = Solution.where(homework: self.homework)
                       .where(student: self.student)
                       .count() + 1
  end
end