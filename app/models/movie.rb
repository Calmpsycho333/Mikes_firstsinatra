class Movie < ActiveRecord::Base
#second steps?
    belongs_to :user 
    #next? #create validate methods
    validates :title, :release_year, presence: true
    
end