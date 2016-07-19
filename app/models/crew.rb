class Crew < ActiveRecord::Base
  #attr_accessible :age, :avatar, :name, :origin, :quote, :species, :title

	validates :name, presence: true 
  validates :title, presence: true, :unless => :new_record?
end
