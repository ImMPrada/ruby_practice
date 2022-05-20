# https://www.hackerrank.com/challenges/balanced-brackets/problem?isFullScreen=true&h_r=next-challenge&h_v=zen
require 'debug'

def isBalanced(s)
  # Write your code here
  open_brackets = ["{", "(", "["]
  brackets_closers = { "{": "}", "(": ")", "[": "]"}
  
  s_arr = s.chars # s transform into array of chars
  answer = "YES"  # default value
  open_found = [] # the stack with opened brackets
  i_flag=0
  
  s_arr.each do |bracket|

    closer_for_current_bracket = brackets_closers[bracket.to_sym]
    if closer_for_current_bracket.nil? && i_flag == 0
        answer = "NO"
        break
    end
    if bracket == "\n"
      break
    end
    i_flag = 1

    if open_brackets.include? bracket

      open_found.push(bracket)
    else

      current_opened = open_found.pop
      if current_opened.nil?
        answer = "NO"
        break
      end
      if brackets_closers[current_opened.to_sym] != bracket
        # puts("#{current_opened} - #{bracket}")
        # gets
        answer = "NO"
        break
      end
      current_opened = nil
    end
  end

  answer
end

file = File.open(File.join(Dir.home, 'Documents', 'PRACTICAS', 'ruby_practice', 'hackerrank', 'stack', 'test', '01', 'test_03_input.txt'))
file_response_expected = File.open(File.join(Dir.home, 'Documents', 'PRACTICAS', 'ruby_practice', 'hackerrank', 'stack', 'test', '01', 'test_03_output.txt'))

i = 0
size_expected = ''
arr = []
arr_results = []
arr_expected = []

file.each do |line|
  size_expected = line if i == 0
  arr << line unless i == 0
  arr_results << isBalanced(line) unless i == 0
  i += 1
end

file_response_expected.each do |line|
  arr_expected << line if line[-1] != "\n"
  arr_expected << line[0...-1] if line[-1] == "\n"
end

compare_expected_result = []

arr_expected.each_with_index do |val, index|
  # compare_expected_result.push("expected:_#{val}_obtained:_#{arr_results[index]}_---_#{val == (arr_results[index])}")
  compare_expected_result.push([index, val == (arr_results[index])])
end

puts(size_expected)
puts(arr.size)
puts(arr_expected.size)

falses = compare_expected_result.filter { |comparison| comparison[1] == false}

puts(falses)
