require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test


  def test_that_foreign_robot_needing_repairs_sent_to_station_1

    # arrange
    @robot = Robot.new
    @robot.needs_repairs = true
    @robot.foreign_model = true


    # act
    is_it_valid = @robot.station

    # assert
    assert_equal(1, is_it_valid)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2
    @robot = Robot.new
    @robot.vintage_model =true
    @robot.needs_repairs = true
    # arrange

    # act
    is_it_valid = @robot.station
    # assert
    assert_equal(2,is_it_valid)
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3
    @robot = Robot.new
    # arrange
    @robot.vintage_model = false
    @robot.needs_repairs = true

    # act
    is_it_valid = @robot.station

    # assert
    assert_equal(3, is_it_valid)
  end

  def test_that_robot_in_good_condition_sent_to_station_4
    @robot = Robot.new
    # arrange
    @robot.needs_repairs = false
    # act
    is_it_valid = @robot.station
    # assert
    assert_equal(4,is_it_valid)
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one


    # arrange
    @robot = Robot.new

    # act
    empty = @robot.prioritize_tasks
    # assert
    assert_equal(-1, empty)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value

    # arrange
    @robot = Robot.new
    @robot.todos = [1,2]

    # act
    max = @robot.prioritize_tasks

    # assert
    assert_equal(2, max)

  end

  def test_workday_on_day_off_returns_false

    # arrange
    @robot = Robot.new
    @robot.day_off = "Sunday"
    @robot.workday?("Sunday")


    # act
    day_off = @robot.workday?("Sunday")


    # assert
    assert_equal(false, day_off)
  end

  def test_workday_not_day_off_returns_true

    # arrange
    @robot = Robot.new
    @day_off = "Sunday"

    # act
    test_workday = @robot.workday?("Monday")


    # assert
    assert_equal(true, test_workday )
  end

end
