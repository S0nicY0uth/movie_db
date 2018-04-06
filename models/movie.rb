class Movie < ActiveRecord::Base
  has_and_belongs_to_many :genres
  
  validates :title, presence: true
end
