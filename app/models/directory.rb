class Directory < ApplicationRecord
  include InertiaErrors
  
  belongs_to :user
  has_many :favorites
  has_many :ingredients, through: :favorites

  validates_presence_of :name
  validates :name, uniqueness: { scope: :user }
  
  def total_price 
    prices = ingredients.pluck(:price).compact
    
    return 0 unless prices.present?
    prices.sum
  end
end
