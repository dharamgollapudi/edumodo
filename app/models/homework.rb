class Homework < ActiveRecord::Base
  belongs_to :teacher

  protected

  def solutions_latest
    self.solutions
        .select("DISTINCT ON(student_id) *")
        .order("student_id, version DESC")
  end
end
