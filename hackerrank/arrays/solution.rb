#!/bin/ruby

require 'json'
require 'stringio'

#
# Complete the 'reverseArray' function below.
#
# The function is expected to return an INTEGER_ARRAY.
# The function accepts INTEGER_ARRAY a as parameter.
#

def reverseArray(a)
    # Write your code here

end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

arr_count = gets.strip.to_i

arr = gets.rstrip.split.map(&:to_i)

res = reverseArray arr

fptr.write res.join " "
fptr.write "\n"

fptr.close()
