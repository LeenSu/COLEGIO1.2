class Period < ActiveRecord::Base
  has_many :grades

  validates :name, presence: true
end
