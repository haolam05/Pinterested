class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable,:validatable
         #,:recoverable, :validatable, :confirmable, :lockable

  has_many :pins
end
