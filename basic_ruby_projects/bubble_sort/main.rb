# https://www.theodinproject.com/lessons/ruby-bubble-sort

puts 'Bubble Sort'

def bubble_sort(numbers)
  sorted = true

  (numbers.length - 1).times do |i|
    sub_arr = [numbers[i], numbers[i + 1]]

    next if sub_arr[0] <= sub_arr[1]

    numbers = numbers[0, i] + sub_arr.sort! + numbers[i + 2...]
    sorted = false
    break
  end

  return bubble_sort(numbers) unless sorted

  numbers
end
