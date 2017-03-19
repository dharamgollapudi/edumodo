class Student < User
  has_many :assignments
  has_many :homeworks, through: :assignments
  has_many :solutions
end