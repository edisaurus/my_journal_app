class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_accessor :signin

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    signin = conditions.delete(:signin)
    where(conditions)
    .where(["lower(username) = :value OR 
            lower(email) = :value", 
            { value: signin.to_s.downcase.gsub(/\s+/, '') }])
    .first
  end
       
  validates :email, :username, :password, :password_confirmation, presence: true
  validates :username, uniqueness: { case_sensitive: false }
  has_many :categories, dependent: :destroy
  has_many :tasks, through: :categories
end
