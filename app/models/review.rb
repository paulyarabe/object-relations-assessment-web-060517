require 'pry'

class Review

  attr_accessor :customer, :restaurant

  @@all = []

  def initialize(review, restaurant)
    @review = review
    @restaurant = restaurant
    @@all << self
  end

  def self.all
      @@all
  end

end
