class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  include AttrJson::Record

  belongs_to :role
  belongs_to :nationality, optional: true
  belongs_to :city
  has_many :projects
end
