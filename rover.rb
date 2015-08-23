class Rover
  DEGREES = (0..179)
  MINIMUM_DISTANCE = 500
  MILLISECONDS_PER_DEGREE = 5

  def initialize
    @angles = []
  end

  attr_reader :angles

  def measure_distances
    DEGREES.each do |degree|
      # move_radar(degree)
      angles[degree] = measure_distance
      print "Scanning #{degree}\r"
      irl MILLISECONDS_PER_DEGREE
    end
    puts ""
  end

  def measure_distance
    [100, 500, 1000, 2000, 1000, 500, 100].sample
  end

  def turn_to_open_path
    measure_distances

    if angles.max > MINIMUM_DISTANCE
      turn_to_degree = angles.index(angles.max)
      turn_rover(turn_to_degree)
    else
      spin_rover_180_degrees
    end
  end

  def turn_rover(degree)
    degrees_of_turn = (degree - 90).abs

    if degree > 90
      turn_direction = "right"
    else
      turn_direction = "left"
    end

    puts "turning #{turn_direction} #{degrees_of_turn} degrees"
    irl MILLISECONDS_PER_DEGREE * degrees_of_turn
  end

  def drive_rover_forward
    puts "driving forward"
    irl MILLISECONDS_PER_DEGREE * 180
  end

  def spin_rover_180_degrees
    puts "spinning 180 degrees"
    irl MILLISECONDS_PER_DEGREE * 180
  end

  def halt_rover
    puts "obstacle detected"
    puts "stopping"
  end

  def start
    turn_to_open_path

    while true do
      if measure_distance > MINIMUM_DISTANCE
        drive_rover_forward
      else
        halt_rover
        turn_to_open_path
        drive_rover_forward
      end
    end
  end

  def irl(milliseconds)
    sleep milliseconds / 1000.0
  end
end

Rover.new.start
