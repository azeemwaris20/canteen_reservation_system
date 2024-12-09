class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  enum role: { student: 'student', canteenstaff: 'canteenstaff' }

  validates :role, presence: true

  before_validation :set_default_role, on: :create

  def set_default_role
    self.role ||= :student
  end
end
