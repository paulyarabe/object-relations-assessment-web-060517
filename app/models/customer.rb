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

customer = Customer.new("Paul", "Yarabe")
