class Restaurant
  attr_accessor :name, :review, :customer

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def add_review(review)
    @reviews = review
  end

  def self.find_by_name(name)
    self.all.detect do |restaurant|
      restaurant.name
    end
  end

  def reviews
    # returns an array of all reviews for that restaurant
    self.class.map do |restaurant|
      if restaurant == self
        restaurant.review
      end
    end
  end

  def customers
    # should return all of the customers who have written reviews of that restaurant.
    self.class.map do |restaurant|
      if restaurant == self
        restaurant.customer
      end
    end
  end

end
