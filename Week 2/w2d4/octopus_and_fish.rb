
# Sluggish Octopus: O(n^2) time

class Array

  fish_arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

  def sluggish_octopus
    longest = ""
    self.length.times do |i|
      self.length.times do |j|
        longest = self[i] if self[i].length > self[j].length
      end
    end
    longest
  end

  p fish_arr.sluggish_octopus


# Dominant Octopus: O(n log n) time.

  def merge_sort(&prc)
    return self if size <= 1

    middle = size / 2
    sorted_left = self.take(middle).merge_sort(&prc)
    sorted_right = self.drop(middle).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged + left + right
  end

  def nlogn_biggest_fish
    prc = Proc.new { |x, y| y.length <=> x.length }
    self.merge_sort(&prc)[0]
  end

  p fish_arr.nlogn_biggest_fish



# Clever Octopus: O(n) time.

  def clever_octopus
    self.reduce("") do |longest, el|
      longest.length > el.length ? longest : el
    end
  end

  p fish_arr.clever_octopus

end


# Dancing Octopus


# Slow Dance: O(n)

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

  def slow_dance(direction, tiles_array)
    tiles_array.each_with_index do |tile, idx|
      return idx if direction == tile
    end
  end

  p slow_dance("up", tiles_array)
  p slow_dance("right-down", tiles_array)

# Constant Dance: 0(1)

  tiles_hash = {
      "up" => 0,
      "right-up" => 1,
      "right"=> 2,
      "right-down" => 3,
      "down" => 4,
      "left-down" => 5,
      "left" => 6,
      "left-up" => 7
  }

  def fast_dance(direction, tiles_hash)
    tiles_hash[direction]
  end

  p fast_dance("up", tiles_hash)
  p fast_dance("right-down", tiles_hash)
