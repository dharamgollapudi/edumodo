class Homework < ActiveRecord::Base
  belongs_to :teacher

  has_many :assignments
  has_many :students, through: :assignments

  validates_presence_of :teacher, :title, :question, :due_on

  protected

  def solutions_latest
    self.solutions
        .select("DISTINCT ON(student_id) *")
        .order("student_id, version DESC")
  end
end
