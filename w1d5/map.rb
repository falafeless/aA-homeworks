class Map

  attr_accessor :map

  def initialize
    @map = []
  end

  def assign(key, value)
    key_idx = nil
    map.each_index do |i|
      if map[i][0] == key
        key_idx = i
        break
      end
    end

    if key_idx.nil?
      map.push([key, value])
    else
      map[key_idx] = [key, value]
    end
  end

  def lookup(key)
    map.select { |el| el[0] == key }
  end

  def remove(key)
    map.reject! { |el| el[0] == key }
  end

  def show
    map
  end
end
