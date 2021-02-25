class Movie < ActiveRecord::Base
#second steps?
    belongs_to :user 
    #next? #create validate methods
    validates :title, :released_year, presence: true
    
end