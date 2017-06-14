class User < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true

  has_many :enrollments,
    primary_key: :id,
    foreign_key: :student_id,
    class_name: :Enrollment

  has_many :enrolled_courses,
    through: :enrollments,
    source: :course #gets course from line 9

end


#valid time stamp?
#student & instructors should be types of users

# What to validate?
# things that need to be entered manually
#check: presence, boolean, uniqueness (by scope), length (for pw)
