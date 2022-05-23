# https://www.hackerrank.com/challenges/arrays-ds/problem?isFullScreen=true

def reverseArray(a)
    # Write your code here
    puts(a)
    last_index = a.size
    reversed_a = []

    (0...last_index).each do |i|
       reversed_a.push(a[-i-1])
    end
    
    reversed_a
end

def hourglassSum(arr)
    # Write your code here
    values = []

    def get_sub_array_sum(index, column_index, arr)
        sub_array = arr[index..index+2].map { |sub_arr| sub_arr[column_index..column_index+2] }
        sub_array[1][0] = 0
        sub_array[1][2] = 0
        
        sub_array_sum = 0
        sub_array.each { |line| sub_array_sum += line.sum }
        sub_array_sum
    end
    
    (0..arr.size-3).each do |index|
        
        (0..arr.size-3).each do |column_index|
            values.push(get_sub_array_sum(index, column_index, arr))
        end
    end
    
    values.max
end

