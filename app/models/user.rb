class User < ApplicationRecord
   # Include default devise modules.
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  include AttrJson::Record

  belongs_to :role
  belongs_to :nationality, optional: true
  belongs_to :city, optional: true            
  
  has_many :projects
  has_many :directories
end
