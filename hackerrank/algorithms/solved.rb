#https://www.hackerrank.com/challenges/a-very-big-sum/problem?isFullScreen=true&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen
#https://www.hackerrank.com/challenges/diagonal-difference/problem?isFullScreen=true&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen

class SolveProposed

  def aVeryBigSum(ar)
    # Write your code here
    size_odd = ar.size.odd?
    size_to_cut = ar.size
    size_to_cut -= 1 if size_odd
    long_sum = 0
    
    (0...size_to_cut/2).each do |index|
        long_sum += ar[index] + ar[-(index+1)]
    end
    
    long_sum += ar[size_to_cut/2] if size_odd
    long_sum
  end

  def diagonalDifference(arr)
    # Write your code here
    i_limit = arr.size  
    sum_diag_1 = 0
    sum_diag_2 = 0
    
    (0...i_limit).each do |index|
       sum_diag_1 += arr[index][index]
       sum_diag_2 += arr[-index-1][index]
    end
    
    (sum_diag_1-sum_diag_2).abs
end
end