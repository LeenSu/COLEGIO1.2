class Grade < ActiveRecord::Base
  belongs_to :period
  has_and_belongs_to_many :students
  has_many :courses

  validates :name, presence: true

  scope :actual, ->{where current: true}
end
