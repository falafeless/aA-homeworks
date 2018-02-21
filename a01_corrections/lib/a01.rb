# Write a method that finds the first `n` Fibonacci numbers recursively.
def fibs_rec(count)
  # fibs_arr = [0, 1]
  # return [0] if count == 1
  # return fibs_arr if count == 2
  #
  # # p fibs_rec(count - 1)
  # # p fibs_rec(count - 2)
  # fibs_arr << fibs_rec(count - 1).last + fibs_rec(count - 2).last

  # ^ Previous code: similar, but tried to take the last of
  #   two recursions. Could maybe work, but couldn't resolve the details.

  return [0] if count == 1
  return [0, 1] if count == 2
  fibs = fibs_rec(count - 1) # save result of recursion into a variable
  fibs << fibs[-1] + fibs[-2] # take last two elements of prev recursion
end

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# I didn't have any issues with the rest of these

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~







# Write a method that binary searches an array for a target and returns its
# index if found. Assume a sorted array.

# NB: YOU MUST WRITE THIS RECURSIVELY (searching half of the array every time).
# We will not give you points if you visit every element in the array every time
# you search.

# For example, given the array [1, 2, 3, 4], you should NOT be checking
# 1 first, then 2, then 3, then 4.

def binary_search(arr, target)
  return nil if arr.empty?
  middle = arr.size / 2
  left, right = arr.take(middle), arr.drop(middle + 1)
  case target <=> arr[middle]
  when -1
    return binary_search(left, target)
  when 0
    return middle
  when 1
    result = binary_search(right, target)
    result.nil? ? nil : result + middle + 1
  end
end

class Array
  # Write an array method that returns `true` if two elements of the array sum
  # to 0 and `false` otherwise
  def two_sum
    self.each_index do |i|
      (i + 1...length).each do |j|
        return true if self[i] + self[j] == 0
      end
    end
    false
  end
end

class String
  # This method returns true if the string can be rearranged to form the
  # sentence passed as an argument.

  # Example:
  # "cats are cool".shuffled_sentence_detector("dogs are cool") => false
  # "cool cats are".shuffled_sentence_detector("cats are cool") => true

  def shuffled_sentence_detector(other)
    self.split.sort == other.split.sort
  end
end

def is_prime?(num)
  (2..num / 2).none? { |factor| num % factor == 0 }
end

# Write a method that returns the nth prime number
def nth_prime(n)
  primes = []
  curr_num = 2
  until primes.length == n
    primes << curr_num if is_prime?(curr_num)
    curr_num += 1
  end
  primes.last
end

class Array
  # Write a method that calls a passed block for each element of the array
  def my_each(&prc)
    i = 0
    while i < length
      prc.call(self[i])
      i += 1
    end
    self
  end

end

class Array
  # Write a method that returns the first element that causes the passed block
  # to evaluate to `true`
  def my_find(&prc)
    i = 0
    while i < length
      return self[i] if prc.call(self[i])
      i += 1
    end
    nil
  end

end
