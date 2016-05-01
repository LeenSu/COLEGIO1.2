class Course < ActiveRecord::Base
  has_many :scores
  belongs_to :teacher
  belongs_to :grade

  validates :name, presence: true

  scope :currents, -> {where grade_id: Grade.where(current: true)}
  scope :old, -> {where grade_id: Grade.where(current: false)}

end
