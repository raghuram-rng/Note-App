class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  devise :database_authenticatable, :authentication_keys => [:username]
  validates :username, uniqueness: true
  has_many :notes
end
