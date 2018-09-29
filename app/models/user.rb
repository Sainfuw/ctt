class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :inscriptions
  has_many :courses, through: :inscriptions
  has_many :messages

  validates_presence_of :email, :username, :firstname, :lastname

end
