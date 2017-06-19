# Please copy/paste all three classes into this file to submit your solution!

require 'pry'

class Customer
  attr_accessor :first_name, :last_name

  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    @@all << self
    # @@all << full_name
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    @@all
  end


  def self.find_by_name(full_name)
    self.all.detect do |customer|
      customer.full_name == full_name ? customer : nil
    end
  end

  def self.find_all_by_first_name(first_name)
    # given a string of a first name, returns an array containing all customers with that first name
    self.all.select do |customer|
      fn_ln_arr = customer.full_name.split(" ")
      if fn_ln_arr[0] == first_name
        customer.full_name
      end
    end
  end

  def self.all_names
    # should return an array of all of the customer full names
    self.all.full_name
  end

  def add_review(content, restaurant)
    # given some content and a restaurant, creates a new review and associates it with that customer and that restaurant
    review = Review.new(content, restaurant)
    review.customer = self
    review.restaurant = restaurant
  end


end



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
