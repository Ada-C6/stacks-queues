# A company has six hiring positions with more people wanting jobs than the
# number of available positions.  The company managers decide in order to give
# more people an opportunity to make money; they will allow people to work in
# three-month intervals. The first six people on the waiting list will be hired
# in the order that they are on the waiting list.  The first six people will
# keep these positions for three months.  At the end of three months, the
# manager will roll a dice to determine the number of people who will lose their
# jobs. The company will use the policy of last-hired-first-fired.  For example,
# if the dice roll is 3, the last 3 people hired will lose their jobs to the
# first 3 people on the waiting list. People losing their jobs will be placed on
# the back of the waiting list in the order that they are fired. This process
# will continue for every three-month interval.

require './Stack.rb'
require './Queue.rb'
require 'faker'
require 'awesome_print'


class CrappyCompany

attr_accessor :currently_working, :waiting_list, :roll, :showing, :number

  def initialize
    @waiting_list = ["Emma Woodhouse", "Emma Bovary", "Katniss Everdeen", "Lady Macbeth", "Anna Karenina", "Scout Finch", "Hester Prynne", "Luna Lovegood", "Liz Bennett", "Anne Elliot", "Hermione Granger", "Jane Eyre", "Arya Stark", "Jo March"]  # queue
    @people_currently_working = [] # stack
    initial_hiring
  end

  def initial_hiring
    6.times do
      @people_currently_working << @waiting_list.shift
    end
    ap @people_currently_working
  end

  def hiring
    @number.times do
      @people_currently_working << @waiting_list.shift
    end
    return @people_currently_working
  end

  def firing
    @number = time_passing
    @number.times do
      @waiting_list << @people_currently_working.pop
    end
    return @waiting_list
  end

  def time_passing
    roll
  end

  def roll
    return @showing = Random.rand(6) + 1  #instead of 0-5 inclusive, it becomes 1-6
  end

  def showing   #same as attr_reader -> just lets you see value
    return @showing
  end

end

company = CrappyCompany.new

ap company.firing
ap company.hiring
ap company.firing
ap company.hiring
ap company.firing
ap company.hiring
