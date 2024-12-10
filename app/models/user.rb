class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  enum role: { student: 'student', canteenstaff: 'canteenstaff' }

  validates :role, presence: true

  before_validation :set_default_role, on: :create

  has_many :reservations

  def set_default_role
    self.role ||= :student
  end
end
