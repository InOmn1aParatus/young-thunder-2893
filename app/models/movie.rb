class Movie < ApplicationRecord
  validates :title, uniqueness: true
  belongs_to :studio
  has_many :movie_actors
  has_many :actors, through: :movie_actors

  def avg_actor_age
    self.actors.average(:age)
  end
end