class Homework < ActiveRecord::Base
  belongs_to :teacher

  has_many :assignments
  has_many :students, through: :assignments

  validates_presence_of :teacher, :title, :question, :due_on

  def can_be_solved?
    self.due_on > Time.now
  end

  def solutions_latest
    self.solutions
        .select("DISTINCT ON(student_id) *")
        .order("student_id, version DESC")
  end

  def solutions_for_student(student)
    self.solutions
        .where(student: student)
  end
end
