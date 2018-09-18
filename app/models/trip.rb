class Trip < ApplicationRecord
  has_many :trip_trails
  has_many :trails, through: :trip_trails

  def total_distance
    trails.sum(:length)
  end

  def avg_trail_distance
    trails.average(:length).round
  end

  def longest_trail
    trails.maximum(:length)
  end

  def shortest_trail
    trails.minimum(:length)
  end 
end
