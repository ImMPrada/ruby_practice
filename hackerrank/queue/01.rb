# https://www.hackerrank.com/challenges/queue-using-two-stacks/problem?isFullScreen=true
require 'debug'

def resolve(list_of_instructions)
  queue = []
  response = []

  list_of_instructions.each do |instruction|
    
    instruction_arr = instruction.split(' ')

    queue.push(instruction_arr[1]) if instruction_arr[0] == '1'
    queue = queue[1...queue.size] if instruction_arr[0] == '2'

    response.push(queue[0]) if instruction_arr[0] == '3'
  end

  response
end


hide_prints = true

['01', '02', '03'].each do |name|


  file = File.open(File.join(Dir.home, 'Documents', 'PRACTICAS', 'ruby_practice', 'hackerrank', 'queue', 'test', '01', "#{name}_input.txt"))
  file_response_expected = File.open(File.join(Dir.home, 'Documents', 'PRACTICAS', 'ruby_practice', 'hackerrank', 'queue', 'test', '01', "#{name}_output.txt"))
  
  i = 0
  size_expected = ''
  arr = []
  arr_results = []
  arr_expected = []
  
  file.each do |line|
    size_expected = line if i == 0
    arr << line if i > 0 && line[-1] != "\n"
    arr << line[0...-1] if i > 0 && line[-1] == "\n"
  
    i += 1
  end
  
  file_response_expected.each do |line|
    arr_expected << line if line[-1] != "\n"
    arr_expected << line[0...-1] if line[-1] == "\n"
  end
  
  response = resolve(arr)
  
  unless hide_prints

    response.each_with_index do |value, index|
      puts("#{value} --- #{arr_expected[index]}")
    end
  end
  
  puts arr_expected == response
end

