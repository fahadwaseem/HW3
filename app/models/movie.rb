class Movie < ActiveRecord::Base
  attr_accessible :title, :rating, :description, :release_date, :all_ratings
  def self.all_ratings
    ["G", "PG", "PG-13", "NC-17" , "R"]
  end
end

