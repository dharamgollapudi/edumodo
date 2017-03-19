class Homework < ActiveRecord::Base
  belongs_to :teacher

  validates_presence_of :teacher, :title, :question, :due_on

  protected

  def solutions_latest
    self.solutions
        .select("DISTINCT ON(student_id) *")
        .order("student_id, version DESC")
  end
end
