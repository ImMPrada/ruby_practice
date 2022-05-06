# https://www.hackerrank.com/challenges/a-very-big-sum/problem?isFullScreen=true&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen
# https://www.hackerrank.com/challenges/diagonal-difference/problem?isFullScreen=true&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen&h_r=next-challenge&h_v=zen
# https://www.hackerrank.com/challenges/mini-max-sum/problem?isFullScreen=true&h_r=next-challenge&h_v=zen

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

  def staircase(n)
    # Write your code here
    
    (1..n).each do |i|
        line = ""
        
        (1..(n-i)).each { |c| line += " " }
        (1..i).each { |c| line += "#" }
        puts(line)
    end
  end

  def miniMaxSum(arr)
    # Write your code here

    sorted_arr = arr.sort
    
    puts("#{sorted_arr[0..3].sum} #{sorted_arr[-4..-1].sum}")
  enddef timeConversion(s)
    # Write your code here
    hours = s[0..1]
    am_pm = s[-2..-1]
    
    if am_pm == "AM"
       hours = "00" if hours.to_i == 12 
    end
    if am_pm == "PM"
       hours = "#{hours.to_i + 12}" if hours != "12" 
    end
    
    hours.to_s + s[2..7]
  end
end